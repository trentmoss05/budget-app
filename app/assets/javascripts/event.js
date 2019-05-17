$(document).on('turbolinks:load', function() {
  $("#userEvents").on("click", function(e){
    e.preventDefault();
    url = this.href
    if ($("#eventShow table").text().length > 0){
      $("#eventShow table").empty()
      $("#userEvents").text("Show")
    } else {
      $.ajax({
        method: "GET",
        url: url,
        dataType: "json",
        success: function (response) {
          let showEvents = response.map(event => new Event(event))
          let formattedEvents = showEvents.map(event => event.formatEvent()).join('')
          $("#userEvents").text("Hide")
          $("#eventShow table").empty()
          $("#eventShow").append("<table><tr><th>Event Name</th><th>Budget</th><th></th</tr>" + formattedEvents + "</table>")
        }
      })
    }
  })

  function toCurrency(amount){
    return(
      '$' + parseInt(amount).toFixed(2)
    )
  }

  class Event{
    constructor(obj) {
      this.name = obj.name,
      this.budget = obj.budget,
      this.id = obj.id,
      this.user_id = obj.user.id
    }
    formatEvent(){
      return(`
        <tr>
          <td>${this.name}</td>
          <td>${toCurrency(this.budget)}</td>
          <td><a href="/events/${this.id}\">Event Page</a></td>
        </tr>`)
    }
  }

  $("#new_expense").on('submit', function(e){
    url = this.action
    data = $(this).serialize()
    $.ajax({
      type: "POST",
      url: url,
      data: data,
      success: function(resp) {
        let expense = new Expense(resp)
        let balance = parseInt($("#budget_balance").text())
        $("#expense_name").val('')
        $("#expense_cost").val('')
        $("#expense_quantity").val(1)
        $("#budget_balance").text((balance-expense.total).toFixed(2))
        $("#expense_table").append(expense.formatExpenses())
      }
    })
    e.preventDefault();
  })




  class Expense {
    constructor(obj) {
      this.name = obj.name,
      this.quantity = obj.quantity,
      this.cost = obj.cost,
      this.id = obj.id,
      this.event_id = obj.event.id
    }

    formatExpenses() {
      return(`
        <tr>
          <td></td>
          <td>${this.name}</td>
          <td>${toCurrency(this.cost)}</td>
          <td>${this.quantity}</td>
          <td>${toCurrency(this.cost * this.quantity)}</td>
          <td><a href="/events/${this.event_id}/expenses/${this.id}/edit\">Edit</a></td>
          <td><a data-method="delete" href="/events/${this.event_id}/expenses/${this.id}">Delete</a></td>
        </tr>`)
    }
  }
})
