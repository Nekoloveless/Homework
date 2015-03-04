require 'selenium-webdriver'
require_relative 'module'

include RunScript

open_browser(:firefox)

set_param('atyiq', 'erthgyhry', 'erfgegh')
login
logout
set_first_user

set_param('vtriq', 'tghyrewe', 'efgwefgr')
login
change_pass
create_project
add_user
change_role
add_version
create_issues
check_issues