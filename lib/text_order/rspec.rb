require 'text_order/matcher'

module TextOrder
  module RSpec
    module Matchers
      def include_text(expected)
        Matcher.new(expected)
      end
    end
  end
end

RSpec.configure do |config|
  config.include TextOrder::RSpec::Matchers
end

RSpec::Matchers.define :appear_after do |expected|
  match do |actual|
    @matcher = TextOrder::Matcher.new(actual).after(expected)
    @matcher.matches?(page.text)
  end

  failure_message do
    @matcher.failure_message
  end

  failure_message_when_negated do
    @matcher.failure_message_when_negated
  end
end

RSpec::Matchers.define :appear_before do |expected|
  match do |actual|
    @matcher = TextOrder::Matcher.new(actual).before(expected)
    @matcher.matches?(page.text)
  end

  failure_message do
    @matcher.failure_message
  end

  failure_message_when_negated do
    @matcher.failure_message_when_negated
  end
end
