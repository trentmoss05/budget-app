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

  class Event{
    constructor(obj) {
      this.name = obj.name,
      this.budget = obj.budget,
      this.id = obj.id
      this.user_id = obj.user.id
    }
    formatEvent(){
      return(`
        <tr>
          <td>${this.name}</td>
          <td>$${this.budget}</td>
          <td><a href="/events/${this.id}\">More Info</a></td>
        </tr>`)
    }
  }
})
