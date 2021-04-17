# frozen_string_literal: true

class Session < Application
  def login
    email = 'user@example.com'
    password = 'password'

    goto_login
    @browser.text_field(name: 'email').set email
    @browser.text_field(name: 'password').set password
    @browser.button(text: 'Log In').click
    @browser.wait_until { |b| b.title.match(/Dashboard/) }
    @browser.text.match(/You are logged in/)
  end

  def logout
    login unless logged_in?
    @browser.link(text: 'Log Out').click
    @browser.wait_until { |b| b.title.match(/Log In/) }
    wait_for_alert
    @browser.text.match(/You have successfully signed out./)
  end
end
