require 'text_order/rspec'

RSpec.describe 'RSpec matchers', type: :feature do
  STRING = 'first middle last'

  describe 'after' do
    it 'detects value after expected text' do
      expect(STRING).to include_text('last').after('first')
    end
  end

  describe 'before' do
    it 'detects value before expected text' do
      expect(STRING).to include_text('first').before('last')
    end
  end
end
