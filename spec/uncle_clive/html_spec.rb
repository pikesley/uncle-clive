module UncleClive
  describe App do
    context 'HTML' do
      specify 'single line' do
        get '/font/html'
        expect(last_response).to be_ok
        expect(last_response.body).to match /<tr><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><\/tr>/
      end

      specify 'multi-line' do
        get '/font/ab---cd'
        expect(last_response).to be_ok
        expect(last_response.body.split("\n").count).to eq 81
      end

      context 'version 1' do
        it 'still works' do
          get '/html', nil, V1_HEADERS
          expect(last_response).to be_ok
          expect(last_response.body).to match /<tr><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><\/tr>/
        end
      end
    end
  end
end
