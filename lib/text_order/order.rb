require 'text_order/position'

module TextOrder
  class Order
    include Position

    attr_reader :matcher, :text

    def initialize(matcher, text)
      @matcher = matcher
      @text = text
    end

    def actual
      matcher.actual
    end

    def expected
      matcher.expected
    end

    def matches?(actual)
      @result = matcher.matches?(actual)
    end

    def failure_message
      matcher.failure_message unless result
    end

    def failure_message_when_negated
      matcher.failure_message_when_negated unless result
    end

    private

    attr_reader :result
  end
end
