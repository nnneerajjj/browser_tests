# frozen_string_literal: true

class Register < Application
  def execute
    goto_register
    fill_form

    @browser.button(text: 'Sign Up').click
    @browser.wait_until { |b| b.title.match(/Dashboard/) }
    logged_in?
  end

  private

  def goto_register
    logout if logged_in?
    @browser.link(href: '/register').click
    @browser.wait_until { |b| b.title.match(/Register/) }
  end

  def fill_form
    @browser.text_field(name: 'email').set Faker::Internet.safe_email
    @browser.text_field(name: 'password').set 'password'
    @browser.text_field(name: 'firstName').set Faker::Name.first_name
    @browser.text_field(name: 'lastName').set Faker::Name.last_name
    @browser.text_field(name: 'phoneNumber').set Faker::PhoneNumber.cell_phone_in_e164
    @browser.scroll.to :bottom
    check_terms_box
  end

  def check_terms_box
    # Terms and conditions checkbox
    # Clicking on label because checkbox is not clickable
    element = @browser.label(class: 'custom-control-label')
    # Click on a cordinate instead of default center.
    # Because center has Terms link
    element.driver.action.move_to(element.wd, 10, 2).click.perform
  end
end
