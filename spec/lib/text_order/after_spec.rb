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

  describe '#failure_message' do
    it 'returns positional failure' do
      matcher = TextOrder::Matcher.new('first')
      after = described_class.new(matcher, 'last')
      after.matches?('first last')

      expect(after.failure_message).to eq(
        %{expected "first" to appear after "last" in "first last"}
      )
    end

    it 'returns composed matcher failure message' do
      matcher = TextOrder::Matcher.new('lol')
      after = described_class.new(matcher, 'no')
      after.matches?('not even')

      expect(after.failure_message).to eq(matcher.failure_message)
    end
  end

  describe '#failure_message_when_negated' do
    it 'returns positional negated failure' do
      matcher = TextOrder::Matcher.new('last')
      after = described_class.new(matcher, 'first')
      after.matches?('first last')

      expect(after.failure_message_when_negated).to eq(
        %{expected "last" not to appear after "first" in "first last"}
      )
    end

    it 'returns composed matcher failure message' do
      matcher = TextOrder::Matcher.new('lol')
      after = described_class.new(matcher, 'no')
      after.matches?('not even')

      expect(after.failure_message_when_negated).to eq(matcher.failure_message_when_negated)
    end
  end
end
