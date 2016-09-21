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

      it 'serves ALL THE COLOURS' do
        get '/colours/'
        expect(last_response).to be_ok
        expect(JSON.parse last_response.body, symbolize_names: true).to eq (
          {
            BLACK: "000000",
            black: "000000",
            BLUE: "0000ff",
            blue: "0000bf",
            CYAN: "00ffff",
            cyan: "00bfbf",
            GREEN: "00ff00",
            green: "00bf00",
            MAGENTA: "ff00ff",
            magenta: "bf00bf",
            RED: "ff0000",
            red: "bf0000",
            WHITE: "ffffff",
            white: "bfbfbf",
            YELLOW: "ffff00",
            yellow: "bfbf00"
          }
        )
      end
    end
  end
end
