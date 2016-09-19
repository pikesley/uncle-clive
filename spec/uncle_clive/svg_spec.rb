module UncleClive
  describe App do
    context 'SVG' do
      context 'single line' do
        it 'serves SVG' do
          get '/font/svg', nil, SVG_HEADERS
          expect(last_response).to be_ok
          expect(last_response.body.split("\n")[9]).to eq "    <rect x='2' y='2' width='3' height='1' class='on' />"
        end

        it 'changes the colour' do
          get '/font/svg?colour=fa8100', nil, SVG_HEADERS
          expect(last_response).to be_ok
          expect(last_response.body.split("\n")[4]).to eq "        fill: #fa8100;"
        end
      end

      context 'multi-line' do
        it 'serves SVG' do
          get '/font/ab---cd', nil, SVG_HEADERS
          expect(last_response).to be_ok
          lines = last_response.body.split("\n")
          expect(lines[0]).to eq"<svg viewBox='0 0 16 16' xmlns='http://www.w3.org/2000/svg'>"
          expect((lines).count).to eq 38
        end

        it 'changes the colour' do
          get '/font/ab---cd?colour=abcdef', nil, SVG_HEADERS
          expect(last_response).to be_ok
          expect(last_response.body.split("\n")[4]).to eq "        fill: #abcdef;"
        end
      end

      context 'version 1' do
        it 'still works' do
          get '/svg', nil, SVG_HEADERS
          expect(last_response).to be_ok
          expect(last_response.body.split("\n")[9]).to eq "    <rect x='2' y='2' width='3' height='1' class='on' />"
        end
      end
    end
  end
end
