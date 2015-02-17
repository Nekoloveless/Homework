require 'selenium-webdriver'
require_relative 'module'

include RunScript

open_browser(:firefox)

set_param('rfgtyhuxds', 'erthgyhry', 'erfgegh')
login
change_pass
last