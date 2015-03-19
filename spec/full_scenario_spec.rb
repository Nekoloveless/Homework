require 'spec_helper'
require_relative '../pages/register_page'
require_relative '../pages/my_account_page'
require 'watir-webdriver'

describe 'Full Scenario' do
  describe 'Registration flow:'
  context 'after successful registration' do
    before :all do
      visit(RegisterPage).register_as('assdfyyydfg')
      on(MyAccountPage).wait_until { @current_page.text.include? 'My account' }
    end
    # it_behaves_like 'current url include', 'my/account'
    # it_behaves_like 'has flash notice', 'Your account has been activated. You can log in now'

    it "current url include 'my/account'" do
      expect(@current_page.current_url).to include 'my/account'
    end

    it "has flash notice 'Your account has been activated. You can log in now'" do
      expect(@current_page.flash_notice).to include 'Your account has been activated. You can log in now'
    end
    describe 'user' do

      it 'should be logged in' do
        expect(@current_page.text).to include 'Logged in'
      end
    end

    describe "Login flow" do
      before :all do
        on(MyAccountPage).logout
      end
      before :all do
        on(MyHomePage).login
      end
      before :all do
        on(LoginPage).
      end

    end

    describe "Logout flow" do

      it 'should be logged out' do
        expect(@current_page.current_url).to include 'demo.redmine.org'
      end
    end
    describe "Chhange password" do

    end
    describe "Create Project" do

    end
    end
  end
  end