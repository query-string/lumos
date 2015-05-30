module Lumos
  module Formatters
    class Surround < Lumos::Formatters::Base
      def result
        horizontal_result
      end

    private

      def horizontal_pattern
        "#{delimiter * chopped_message_length}"\
        "#{padding > 0 ? (delimiter * padding) * 2 : nil}"\
        "#{delimiter * 2}"
      end

      def horizontal_padding
        "#{content_paragraph(" " * chopped_message_length)}\n" * padding if padding > 0
      end

      def content_paragraph(line)
        "#{delimiter}#{vertical_padding}#{line}#{vertical_padding}#{chopping_padding line}#{delimiter}"
      end
    end
  end
end
