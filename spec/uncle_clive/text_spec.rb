module UncleClive
  TEXT_HEADERS = { 'HTTP_ACCEPT' => 'text/plain' }

  describe App do
    context 'text' do
      specify 'single line' do
        get '/text', nil, TEXT_HEADERS
        expect(last_response).to be_ok
        expect(last_response.body.split("\n")[2]).to eq "    ()()()          ()()()        ()      ()        ()()()      "
      end

      specify 'multi-line' do
        get 'ab---cd', nil, TEXT_HEADERS
        expect(last_response).to be_ok
        expect(last_response.body.split("\n").count).to eq 16
      end
    end
  end
end
