module UncleClive
  JSON_HEADERS = { 'HTTP_ACCEPT' => 'application/json' }
  TEXT_HEADERS = { 'HTTP_ACCEPT' => 'text/plain' }
  SVG_HEADERS = { 'HTTP_ACCEPT' => 'image/svg+xml' }

  describe App do
    it 'has a homepage' do
      get '/'
      expect(last_response).to be_ok
      expect(last_response.body).to match /Sinclair Spectrum Font as a Service/
    end

    context 'spectrum font' do
      it 'serves JSON' do
        get '/json', nil, JSON_HEADERS
        expect(last_response).to be_ok
        expect(JSON.parse last_response.body).to eq (
          {
            'id' => 'json',
            'data' => [
              [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
              [0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
              [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0],
              [0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0],
              [0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0],
              [0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0],
              [0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0],
              [0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]]
          }
        )
      end

      it 'serves HTML' do
        get '/html'
        expect(last_response).to be_ok
        expect(last_response.body).to match /<tr><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><\/tr>/
      end

      it 'serves text' do
        get '/text', nil, TEXT_HEADERS
        expect(last_response).to be_ok
        expect(last_response.body.split("\n")[2]).to eq "    ()()()          ()()()        ()      ()        ()()()      "
      end

      it 'serves SVG' do
        get '/svg', nil, SVG_HEADERS
        expect(last_response).to be_ok
        expect(last_response.body.split("\n")[9]).to eq "<rect x='2' y='2' width='3' height='1' class='on' />"
      end
    end
  end
end
