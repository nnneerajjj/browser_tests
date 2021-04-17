# frozen_string_literal: true

class ForgotPassword < Application
  def invalid
    goto_login
    goto_forgot_password
    @browser.text_field(name: 'email').set Faker::Internet.safe_email
    @browser.button(text: 'Request Reset').click
    wait_for_alert(type: 'danger')
    @browser.text.match(/An error occurred./)
  end

  def valid
    goto_login
    goto_forgot_password
    @browser.text_field(name: 'email').set 'user@example.com'
    @browser.button(text: 'Request Reset').click
    wait_for_alert
    @browser.text.match(/Follow the instructions in the email we have now sent you to complete your password reset./)
  end

  private

  def goto_forgot_password
    @browser.link(text: 'Forgot password?').click
    @browser.wait_until { |b| b.title.match(/Forgot Password/) }
  end
end
