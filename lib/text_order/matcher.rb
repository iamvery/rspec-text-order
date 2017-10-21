module TextOrder
  class Matcher
    attr_reader :expected

    def initialize(expected)
      @expected = expected
    end

    def matches?(actual)
      actual.include?(expected)
    end
  end
end
