require 'text_order/matcher'

RSpec.describe TextOrder::Matcher do
  it 'detects included text' do
    matcher = described_class.new('lolwat')

    expect(matcher.matches?('hahalolwatok')).to be(true)
    expect(matcher.matches?('lolno')).to be(false)
  end
end
