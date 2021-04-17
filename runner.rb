# frozen_string_literal: true

require 'bundler/setup'
Bundler.require

Figaro.application = Figaro::Application.new(
  environment: 'development',
  path: File.expand_path('config/application.yml', __dir__)
)

Figaro.load
Figaro.require_keys('BROWSER', 'BASE_URL', 'HEADLESS')

# require File.expand_path('application.rb', __dir__)
Dir[File.join(__dir__, 'tests', '*.rb')].sort.each { |file| require file }

class Runner
  def initialize
    @browser = Watir::Browser.new Figaro.env.browser.to_sym, headless: Figaro.env.headless.to_s == 'true'
    base_url = Figaro.env.base_url

    @browser.goto base_url
  end

  def execute(args)
    %i[contact login logout forgot_password register].each do |test_name|
      if args.include?(test_name.to_s) || args.empty?
        result = send(test_name)
        render_result(test_name, result)
      end
    end
  ensure
    @browser.close
  end

  private

  def login
    Session.new(@browser).login
  end

  def logout
    Session.new(@browser).logout
  end

  def contact
    Contact.new(@browser).send
  end

  def forgot_password
    instance = ForgotPassword.new(@browser)

    result = instance.invalid
    render_result('forgot_password invalid', result)

    instance.valid
  end

  def register
    Register.new(@browser).execute
  end

  def render_result(test_name, result)
    puts ''
    if !result.nil?
      puts "Result: #{result}"
      puts 'PASS'
    else
      puts 'FAIL'
    end

    puts "Test: #{test_name}"
  end
end

Runner.new.execute(ARGV)
