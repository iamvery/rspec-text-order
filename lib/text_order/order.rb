module TextOrder
  class Order
    attr_reader :matcher, :text

    def initialize(matcher, text)
      @matcher = matcher
      @text = text
    end

    def expected
      matcher.expected
    end

    def matches?(actual)
      matcher.matches?(actual)
    end
  end
end
