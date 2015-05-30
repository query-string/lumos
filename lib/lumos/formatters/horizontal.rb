module Lumos
  module Formatters
    class Horizontal < Lumos::Formatters::Base
      def initialize(options = {})
        super
        @padding = options.fetch(:padding, 0).to_i.abs
      end

      def result
        horizontal_result
      end

    private

      def content_paragraph(line)
        line
      end
    end
  end
end
