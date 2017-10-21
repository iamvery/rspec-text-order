require 'text_order/order'

module TextOrder
  class Before < Order
    def matches?(actual)
      super and is_before?(actual)
    end

    private

    def is_before?(actual)
      actual.index(expected) < actual.index(text)
    end
  end
end
