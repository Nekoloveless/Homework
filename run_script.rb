require 'selenium-webdriver'
require_relative 'module'

include RunScript

open_browser(:firefox)

set_param('thrhnvbkuio', 'erthgyhry', 'erfgegh')
login
logout
set_first_user

set_param('gbhtreddf', 'tghyrewe', 'efgwefgr')
login
change_pass
create_project
add_user
change_role
last