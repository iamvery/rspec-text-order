module TextOrder
  class Matcher
    attr_reader :actual, :expected

    def initialize(expected)
      @expected = expected
    end

    def matches?(actual)
      @actual = actual
      actual.include?(expected)
    end

    def failure_message
      %{expected "#{actual}" to include the text "#{expected}"}
    end

    def failure_message_when_negated
      %{expected "#{actual}" not to include the text "#{expected}"}
    end
  end
end
