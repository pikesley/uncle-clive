# via http://labs.headshift.com/2012/02/14/cucumber-to-test-mobile-in-a-rails-project/

module CapybaraHeadersHelper
  def add_headers(headers)
    headers.each do |name, value|
      page.driver.browser.header(name, value)
    end
  end
end
World(CapybaraHeadersHelper)

