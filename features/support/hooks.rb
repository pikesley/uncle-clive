Before '@json' do
  add_headers({'Accept' => 'application/json'})
end

Before '@html' do
  add_headers({'Accept' => 'application/html'})
end