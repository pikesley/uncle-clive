module UncleClive
  JSON_HEADERS = { 'HTTP_ACCEPT' => 'application/json' }
  TEXT_HEADERS = { 'HTTP_ACCEPT' => 'text/plain' }

  describe App do
    it 'serves the font' do
      get '/font/json', nil, JSON_HEADERS
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

    context 'error messages' do
      it 'serves a message' do
        get '/messages/r'
        expect(last_response).to be_ok
        expect(JSON.parse last_response.body).to eq (
          {
            'id' => 'r',
            'message' => 'R - Tape loading error'
          }
        )
      end

      it 'serves text' do
        get '/messages/1', nil, TEXT_HEADERS
        expect(last_response).to be_ok
        expect(last_response.body).to eq '1 - NEXT without FOR'
      end
    end
  end
end
