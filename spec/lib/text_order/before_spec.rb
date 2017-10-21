require 'text_order/before'
require 'text_order/matcher'

RSpec.describe TextOrder::Before do
  it 'detects text positioned before the matchers expected value' do
    matcher = TextOrder::Matcher.new('first')
    before = described_class.new(matcher, 'last')

    expect(before.matches?('first last')).to be(true)
    expect(before.matches?('last first')).to be(false)
    expect(before.matches?('not even')).to be(false)
  end
end
