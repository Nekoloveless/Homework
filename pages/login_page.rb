class LoginPage
  include PageObject

  text_field :username, id: 'username'
  text_field :password, id: 'password'

end