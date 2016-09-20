module UncleClive
  describe App do
    context 'text' do
      specify 'single line' do
        get '/font/text', nil, TEXT_HEADERS
        expect(last_response).to be_ok
        expect(last_response.body.split("\n")[2]).to eq "    ()()()          ()()()        ()      ()        ()()()      "
      end

      specify 'multi-line' do
        get '/font/ab---cd', nil, TEXT_HEADERS
        expect(last_response).to be_ok
        expect(last_response.body.split("\n").count).to eq 16
      end

      context 'version 1' do
        it 'still works' do
          get '/text', nil, TEXT_HEADERS.merge(V1_HEADERS)
          expect(last_response).to be_ok
          expect(last_response.body.split("\n")[2]).to eq "    ()()()          ()()()        ()      ()        ()()()      "
        end
      end
    end
  end
end
