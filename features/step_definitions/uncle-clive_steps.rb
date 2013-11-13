Then /^the response should be JSON:$/ do |json|
  JSON.parse(page.body).should == JSON.parse(json)
end

Then /^the response should be a text block:$/ do |text|
  page.should have_content(text)
end

Then /^(?:|I )should see "([^\"]*)" inside "([^\"]*)"$/ do |inner, outer|
  with_scope(outer) do
    if page.respond_to? :should
      page.should have_selector(inner)
    else
      assert page.has_content?(inner)
    end
  end
end