module Lumos
  module Formatters
    module BaseHorizontal
      def horizontal_pattern
        delimiter * chopped_message_length
      end

      def horizontal_line
        paragraph      = content_paragraph(chopped_message[0])
        paragraph_size = paragraph.size
        draft_size     = horizontal_pattern.size

        draft_size > paragraph_size ? horizontal_pattern[0...paragraph_size] : horizontal_pattern
      end

      def horizontal_padding
        "\n" * padding if padding > 0
      end

      def horizontal_result
        "#{horizontal_line}\n"\
        "#{horizontal_padding}"\
        "#{iterate_chopped_lines{ |line| "#{content_paragraph(line)}\n" }}"\
        "#{horizontal_padding}"\
        "#{horizontal_line}"
      end
    end
  end
end
