# step 1:
  I want people to be able to create username and password on signup page, login on logout page, and have ability to log out.

# step 2:
  I want users to be able to create an account (ex. "savings account"), and start with a balance of their choosing. Be able to add transactions when money is spent from the account, subtracting it from the balance.

  users
    has many accounts

  accounts
    belongs to user

  transactions
    belongs to account

# step 3:
  URLS needed for user model

  get /signup
    -form
  post /signup

  get /login
    -form
  post /login
    -log the user in
