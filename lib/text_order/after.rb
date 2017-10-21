require 'text_order/order'

module TextOrder
  class After < Order
    def matches?(actual)
      super and is_after?(actual)
    end

    private

    def is_after?(actual)
      actual.index(expected) > actual.index(text)
    end
  end
end
