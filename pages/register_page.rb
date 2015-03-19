class RegisterPage
  include PageObject

page_url 'http://demo.redmine.org/account/register'


  text_field :login, id: 'user_login'
  text_field :password, id: 'user_password'
  text_field :confirm, id: 'user_password_confirmation'
  text_field :name, id: 'user_firstname'
  text_field :last_name, id: 'user_lastname'
  text_field :mail, id: 'user_mail'
  button :commit, name: 'commit'



  def register_as(login)
    self.login_element.when_visible.send_keys login
    self.password = 'asdfgh'
    self.confirm = 'asdfgh'
    self.name = 'qwerty'
    self.last_name = 'qwerty'
    self.mail = 'qwerty@ghbt.tyu'
    self.commit
  end

end