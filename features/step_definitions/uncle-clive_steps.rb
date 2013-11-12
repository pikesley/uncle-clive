Then /^the response should be JSON:$/ do |json|
   JSON.parse(page.body).should == JSON.parse(json)
end

When(/^I request JSON$/) do
  add_headers({'Accept' => 'application/json'})
  add_headers({'Content-Type' => 'application/json'})
end