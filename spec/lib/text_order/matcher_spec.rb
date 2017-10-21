require 'text_order/matcher'

RSpec.describe TextOrder::Matcher do
  it 'detects included text' do
    matcher = described_class.new('lolwat')

    expect(matcher.matches?('hahalolwatok')).to be(true)
    expect(matcher.matches?('lolno')).to be(false)
  end

  it 'returns failure message' do
    matcher = described_class.new('lol')
    matcher.matches?('wat')

    expect(matcher.failure_message).to eq(%{expected "wat" to include the text "lol"})
  end

  it 'returns negated failure message' do
    matcher = described_class.new('lol')
    matcher.matches?('wat')

    expect(matcher.failure_message_when_negated).to eq(%{expected "wat" not to include the text "lol"})
  end
end
