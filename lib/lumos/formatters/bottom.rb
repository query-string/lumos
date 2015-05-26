module Lumos
  module Formatters
    class Bottom < Lumos::Formatters::Base
      def initialize(options = {})
        super
        @padding = options.fetch(:padding, 0).to_i.abs
      end

      def result
        "#{iterate_chopped_lines{ |line| "#{content_paragraph(line)}\n" }}"\
        "#{horizontal_padding}"\
        "#{horizontal_line}"
      end

    private

      def content_paragraph(line)
        line
      end
    end
  end
end
