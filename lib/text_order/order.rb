module TextOrder
  class Order
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
      @matched = matcher.matches?(actual)
    end

    def failure_message
      matcher.failure_message unless matched?
    end

    def failure_message_when_negated
      matcher.failure_message_when_negated unless matched?
    end

    private

    attr_reader :matched
    alias_method :matched?, :matched
  end
end
