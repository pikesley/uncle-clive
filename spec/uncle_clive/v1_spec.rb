module UncleClive
  describe App do
    context 'still works' do
      specify 'with a custom header' do
        get '/font', nil, JSON_HEADERS.merge(V1_HEADERS)
        expect(last_response).to be_ok
        expect(JSON.parse last_response.body).to include (
          {
            'id' => 'font'
          }
        )
      end
    end
  end
end
