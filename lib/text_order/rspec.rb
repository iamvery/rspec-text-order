require 'text_order/matcher'

module TextOrder
  module RSpec
    module Matchers
      def include_text(expected)
        Matcher.new(expected)
      end
    end
  end
end

RSpec.configure do |config|
  config.include TextOrder::RSpec::Matchers
end
