class TestHelper
  include UncleClive::Helpers
end

module UncleClive
  describe Helpers do
    let(:helpers) { TestHelper.new }

    it 'has a config' do
      expect(CONFIG).to be_a Hash
    end

    context 'cleave' do
      it 'splits text' do
        expect(helpers.cleave 'multi---line').to eq ['multi', 'line']
      end

      it 'returns a single string where appropriate' do
        expect(helpers.cleave 'singleton').to eq 'singleton'
      end

      it 'splits on a custom separator' do
        expect(helpers.cleave 'split_me', separator: '_').to eq ['split','me']
      end
    end
  end
end
