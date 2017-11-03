require 'text_order/order'

module TextOrder
  class Before < Order
    def matches?(actual)
      super and is_before?(actual)
    end

    def failure_message
      super or %{expected "#{expected}" to appear before "#{text}" in "#{actual}"}
    end

    def failure_message_when_negated
      super or %{expected "#{expected}" not to appear before "#{text}" in "#{actual}"}
    end

    def after(text)
      After.new(self, text)
    end

    private

    def is_before?(actual)
      actual.index(expected) < actual.index(text)
    end
  end
end
