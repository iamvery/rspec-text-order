require 'capybara/rspec'
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

  describe 'between' do
    it 'detects value both before and after expected text' do
      expect(STRING).to include_text('middle').before('last').after('first')
      expect(STRING).to include_text('middle').after('first').before('last')
    end
  end

  describe 'in order' do
    it 'detects values in order in expected text' do
      expect(STRING).to include_in_order('first', 'middle', 'last')
    end
  end

  describe 'capybara page content' do
    App = ->(*) { [200, {}, ['<div>first</div><div>middle</div><div>last</div>']] }
    Capybara.app = App

    it 'is useful in combination with capybara to determine page content ordering' do
      visit '/'
      expect(page.text).to include_text('middle').before('last').after('first')
    end

    it 'provides some useful shortcut matchers' do
      visit '/'

      expect('first').to appear_before('middle')
      expect('last').to appear_after('middle')
    end
  end
end
