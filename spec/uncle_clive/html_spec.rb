module UncleClive
  describe App do
    context 'HTML' do
      specify 'single line' do
        get '/html'
        expect(last_response).to be_ok
        expect(last_response.body).to match /<tr><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><\/tr>/
      end

      specify 'multi-line' do
        get '/ab---cd'
        expect(last_response).to be_ok
        expect(last_response.body.split("\n").count).to eq 81
      end
    end
  end
end
