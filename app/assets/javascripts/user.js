$( document ).on('turbolinks:load', function() {
   $(".eventBrief").on("click", function(e) {
     e.preventDefault();
     url = this.href
     $.ajax({
       method: "GET",
       url: url,
       dataType: "json",
       success: function (response) {
         let expenses = response["expenses"].map(expense =>
           "<tr> <td> </td> <td>"
           + expense["name"] +
           "</td> <td>"
           + toCurrency(expense["cost"]) +
           "</td><td>"
           + expense["quantity"] +
           "</td>  <tr>"
         )

         let guests = "<br><h4>Guest List</h4><p><ul>" + response["guests"].map(guest =>"<li>"+guest["name"]+"</li>").join('') + "</ul></p>"

          $event =$("#briefedEvent"+response['id'])
          $guest =$("#briefedGuest"+response['id'])

          $event.empty()
          $guest.empty()

          $guest.append(guests)
          $guest.attr('class','data_block')
          $event.append( "<table><tr><th>#</th><th>Name</th><th>Cost</th><th>Quantity</th></tr>" +  expenses.join('') + "</table>")
          $event.attr('class','data_block')
       }
     })
   })

   $("#shoppingList").on("click", function(e) {
     e.preventDefault();
     url = this.href
     if ($("#showShoppingList table").text().length > 0){
       $("#showShoppingList table").empty()
       $("#shoppingList").text("Show List")
     } else {
       $.ajax({
         method: "GET",
         url: url,
         dataType: "json",
         success: function (response) {
           let allExpenses = response.map(expense => new Expense(expense))
           let formattedExpenses = allExpenses.map(expense => expense.formatExpenses()).join('')
           $("#shoppingList").text("Hide List")
           $("#showShoppingList table").empty()
           $("#showShoppingList").append("<table><tr><th>Name</th><th>Quantity</th><th>Cost</th><th></th></tr>" + formattedExpenses + "</table>")
         }
       })
     }
   })

   function toCurrency(amount){
     return(
       '$' + parseInt(amount).toFixed(2)
     )
   }

   class Expense{
     constructor(obj){
       this.name = obj.name,
       this.quantity = obj.quantity
       this.id = obj.id
       this.cost = obj.cost
       this.event_id = obj.event.id
     }
     formatExpenses(){
       return(`
         <tr>
          <td>${this.name}</td>
          <td>${this.quantity}</td>
          <td>${toCurrency((this.quantity * this.cost))}</td>
        </tr>`)
     }
   }
  });
