module TextOrder
  module Position
    def after(text)
      After.new(self, text)
    end

    def before(text)
      Before.new(self, text)
    end
  end
end
