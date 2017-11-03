require 'text_order/order'

module TextOrder
  class After < Order
    def matches?(actual)
      super and is_after?(actual)
    end

    def failure_message
      super or %{expected "#{text}" to appear after "#{expected}" in "#{actual}"}
    end

    def failure_message_when_negated
      super or %{expected "#{text}" not to appear after "#{expected}" in "#{actual}"}
    end

    def before(text)
      Before.new(self, text)
    end

    private

    def is_after?(actual)
      actual.index(expected) > actual.index(text)
    end
  end
end
