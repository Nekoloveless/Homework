require 'rspec'
require 'page-object'
require 'data_magic'


RSpec.configure do |config|
  config.include PageObject::PageFactory
  config.before :all do
    @browser = Watir::Browser.new :firefox

    @browser.window.maximize
  end


  config.after :all do
    @browser.close
  end
end

@name = 'name 12321341'


shared_examples 'current url include' do |message|
  it "#{message}" do
    expect(@current_page.current_url).to include message

  end
end
shared_examples 'has flash notice' do |message|
  it "with message #{message}" do
    expect(@current_page.flash_notice).to include message
  end
end




