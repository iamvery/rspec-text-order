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

  describe '#failure_message' do
    it 'returns positional failure' do
      matcher = TextOrder::Matcher.new('last')
      before = described_class.new(matcher, 'first')
      before.matches?('first last')

      expect(before.failure_message).to eq(
        %{expected "last" to appear before "first" in "first last"}
      )
    end

    it 'returns composed matcher failure message' do
      matcher = TextOrder::Matcher.new('lol')
      before = described_class.new(matcher, 'no')
      before.matches?('not even')

      expect(before.failure_message).to eq(matcher.failure_message)
    end
  end

  describe '#failure_message_when_negated' do
    it 'returns positional negated failure' do
      matcher = TextOrder::Matcher.new('first')
      before = described_class.new(matcher, 'last')
      before.matches?('first last')

      expect(before.failure_message_when_negated).to eq(
        %{expected "first" not to appear before "last" in "first last"}
      )
    end

    it 'returns composed matcher failure message' do
      matcher = TextOrder::Matcher.new('lol')
      before = described_class.new(matcher, 'no')
      before.matches?('not even')

      expect(before.failure_message_when_negated).to eq(matcher.failure_message_when_negated)
    end
  end
end
