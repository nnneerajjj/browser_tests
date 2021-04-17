# frozen_string_literal: true

class Application
  def initialize(browser)
    @browser = browser
  end

  protected

  def logged_in?
    @browser.link(text: 'Log Out').exists?
  end

  def goto_login
    logout if logged_in?
    @browser.link(text: 'Log In').click unless @browser.title.match(/Log In/)
    @browser.wait_until { |b| b.title.match(/Log In/) }
  end

  def logout
    Session.new(@browser).logout
  end

  def wait_for_alert(type: 'success')
    @browser.div(class: "alert-#{type}").wait_until(&:present?)
  end
end
