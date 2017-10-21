require 'text_order/after'
require 'text_order/matcher'

RSpec.describe TextOrder::After do
  it 'detects text positioned after the matchers expected value' do
    matcher = TextOrder::Matcher.new('last')
    after = described_class.new(matcher, 'first')

    expect(after.matches?('first last')).to be(true)
    expect(after.matches?('last first')).to be(false)
    expect(after.matches?('not even')).to be(false)
  end
end
