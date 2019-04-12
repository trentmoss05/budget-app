# step 1:
  I want people to be able to create username and password on signup page, login on logout page, and have ability to log out.

# step 2:
  I want users to be able to create an event (ex. "birthday party"), and start with a budget of their choosing. Be able to add transactions when money is spent from the account, subtracting it from the budget.

  users
    has many events

  events
    belongs to user

  expenses
    belongs to event

# step 3:
  URLS needed for user model

  get /signup
    -form
  post /signup

  get /login
    -form
  post /login
    -log the user in
