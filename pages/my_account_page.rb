class MyAccountPage
  include PageObject

  div :flash_notice
  button :logout, class: 'logout'
end