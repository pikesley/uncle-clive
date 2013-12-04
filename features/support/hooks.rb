Before('@json, @pokrovsky') do
  add_headers(
      {
          'Accept' => 'application/json'
      }
  )
end

Before '@html' do
  add_headers(
      {
          'Accept' => 'text/html'
      }
  )
end

Before '@text' do
  add_headers(
      {
          'Accept' => 'text/plain'
      }
  )
end

Before '@png' do
  add_headers(
      {
          'Accept' => 'img/png'
      }
  )
end