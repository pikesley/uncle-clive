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
    end
  end
end
