Then /^the response should be JSON:$/ do |json|
   JSON.parse(page.body).should == JSON.parse(json)
end

When(/^I request JSON$/) do
  add_headers({'Accept' => 'application/json'})
end

When(/^I request HTML$/) do
  add_headers({'Accept' => 'application/html'})
end
