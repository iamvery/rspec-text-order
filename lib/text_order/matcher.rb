require 'text_order/after'
require 'text_order/before'

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

    def after(text)
      After.new(self, text)
    end

    def before(text)
      Before.new(self, text)
    end
  end
end
