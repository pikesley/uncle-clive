module UncleClive
  describe App do
    context 'colours' do
      it 'serves colours' do
        get '/colours/magenta', nil, JSON_HEADERS
        expect(last_response).to be_ok
        expect(JSON.parse last_response.body).to eq (
          {
            'id' => 'magenta',
            'hex' => 'bf00bf'
          }
        )
      end

      it 'serves BRIGHT colours' do
        get '/colours/WHITE', nil, JSON_HEADERS
        expect(last_response).to be_ok
        expect(JSON.parse last_response.body).to eq (
          {
            'id' => 'WHITE',
            'hex' => 'ffffff'
          }
        )
      end

      it 'serves text' do
        get '/colours/cyan', nil, TEXT_HEADERS
        expect(last_response).to be_ok
        expect(last_response.body).to eq '00bfbf'
      end

      it 'serves JSON by default' do
        get '/colours/YELLOW'
        expect(last_response).to be_ok
        expect(JSON.parse last_response.body).to eq (
          {
            'id' => 'YELLOW',
            'hex' => 'ffff00'
          }
        )
      end
    end
  end
end
