Then /^the response should be JSON:$/ do |json|
   JSON.parse(page.body).should == JSON.parse(json)
end

Then /^the response should be a text block:$/ do |text|
  page.should have_content(text)
end