module RunScript


  def open_browser(browser)
    @driver = Selenium::WebDriver.for browser
    @driver.get 'http://demo.redmine.org'
  end

  def set_param (option1, option2, option3)
    @name = option1
    @password1 = option2
    @password2 = option3
    @projectname = option1 + option2
    @email = @name + '@rt.ty'
  end

  def set_first_user
    @first = @name
  end

  def login
    @driver.find_element(class: 'register').click
    @driver.find_element(id: 'user_login').send_keys @name
    @driver.find_element(id: 'user_password').send_keys @password1
    @driver.find_element(id: 'user_password_confirmation').send_keys @password1
    @driver.find_element(id: 'user_firstname').send_keys @name
    @driver.find_element(id: 'user_lastname').send_keys @name
    @driver.find_element(id: 'user_mail').send_keys @email
    @driver.find_element(name: 'commit').click
  end

  def logout

    @driver.find_element(class: 'logout').click
  end

  def change_pass
    @driver.find_element(class: 'my-account').click
    @driver.find_element(:xpath, ".//*[@id='content']/div[1]/a").click
    @driver.find_element(id: 'password').send_keys @password1
    @driver.find_element(id: 'new_password').send_keys @password2
    @driver.find_element(id: 'new_password_confirmation').send_keys @password2
    @driver.find_element(name: 'commit').click
  end

  def create_project
    @driver.find_element(class: 'projects').click
    @driver.find_element(:xpath, ".//*[@id='content']/div[1]/a[1]").click
    @driver.find_element(id: 'project_name').send_keys @projectname
    @driver.find_element(name: 'commit').click
  end

  def add_user
    @driver.find_element(id: 'tab-members').click
    @driver.find_element(id: 'principal_search').send_keys @first
    sleep 2
    @user_id = @driver.find_element(:xpath, ".//div[@id='principals']/label[contains(text()," + @first +")]/input").attribute('value')
    @driver.find_element(:xpath, ".//div[@id='principals']/label[contains(text()," + @first +")]/input").click #вариант 2 .//div[@id='principals']/label[.=' olga olga']/input
    @driver.find_element(:xpath, ".//label[.=' Manager']/input").click
    @driver.find_element(id: 'member-add-submit').click
  end

  def change_role
    sleep 2
    @driver.find_elements(css: '.icon-edit')[1].click # теперь это место не работает
    sleep 2
    @driver.find_element(:xpath, "(//input[@name='membership[role_ids][]'])[5]").click
    sleep 2
    @driver.find_element(:xpath, "(//input[@name='membership[role_ids][]'])[6]").click
    sleep 2
    @driver.find_element(:xpath, "(//input[@name='commit'])[4]").click
  end

  def add_version
    @driver.find_element(id: 'tab-versions').click
    sleep 1
    @driver.find_element(:xpath,".//*[@id='tab-content-versions']/p[2]/a").click
    sleep 1
    @driver.find_element(id: 'version_name').send_keys 'task 1'
    sleep 1
    @driver.find_element(id: 'version_sharing').click
    sleep 1
    @driver.find_element(:xpath,".//*[@id='version_sharing']/option[2]").click
    sleep 1
    @driver.find_element(name: 'commit').click
    sleep 1
  end

  def create_issues
    @i=1
    while (@i < 4)
      @driver.find_element(class: 'new-issue').click
      @driver.find_element(id: 'issue_tracker_id').click
      sleep 2
      @driver.find_element(:xpath, "//*[@id='issue_tracker_id']/option[" + String(@i) + "]").click
      sleep 2
      @driver.find_element(id: 'issue_subject').send_keys "issue " + String(@i)
      @driver.find_element(name: 'commit').click
      @i+=1
    end

  end

  def check_issues
    @driver.find_element(class: 'issues').click
  end


#fail 'You are looser' if driver.find_element(id: 'flash_error')
#fail 'Expected message did not meet' unless driver.find_element(id: 'flash_notice').text == 'Your account has been activated. You can now log in.asdf'

end