module UncleClive
  describe App do
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

      it 'traps a duff key' do
        get '/messages/CYAN', nil, JSON_HEADERS
        expect(last_response.status).to eq 404
        expect(JSON.parse last_response.body).to eq (
          {
            'error' => 'not found'
          }
        )
      end

      it 'serves ALL THE MESSAGES' do
        get '/messages/'
        expect(last_response).to be_ok
        expect(JSON.parse last_response.body).to include (
          {
            '0' => 'OK',
            '1' => 'NEXT without FOR',
            '2' => 'Variable not found'
          }
        )
        expect(JSON.parse last_response.body).to include (
          {
            'P' => 'FN without DEF',
            'Q' => 'Parameter error',
            'R' => 'Tape loading error'
          }
        )
      end
    end
  end
end
