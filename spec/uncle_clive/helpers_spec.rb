class TestHelper
  include UncleClive::Helpers
end

module UncleClive
  describe Helpers do
    let(:helpers) { TestHelper.new }

    it 'says hello' do
      expect(helpers.hello).to eq 'Hello'
    end

    it 'has a config' do
      expect(CONFIG).to be_a Hash
    end
  end
end
