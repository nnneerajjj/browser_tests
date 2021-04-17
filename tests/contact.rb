# frozen_string_literal: true

class Contact < Application
  def send
    @browser.link(text: 'Contact').click
    @browser.wait_until { |b| b.title.match(/Contact/) }
    fill_form
    @browser.button(text: 'Send Message').click
    wait_for_alert
    contact_success_message = 'Your message has been sent. Expect a response shortly!'
    @browser.text.match(contact_success_message)
  end

  private

  def fill_form
    @browser.text_field(name: 'firstName').set Faker::Name.first_name
    @browser.text_field(name: 'lastName').set Faker::Name.last_name
    @browser.text_field(name: 'email').set Faker::Internet.safe_email
    @browser.select_list(name: 'reason').select 'Error Reporting'
    @browser.textarea(name: 'message').set Faker::Lorem.paragraph
  end
end
