module Lumos
  module Formatters
    class Base
      attr_reader :message, :delimiter, :padding, :length

      def initialize(options = {})
        @message   = options.fetch(:message)
        @delimiter = options.fetch(:delimiter, "#").to_s
        @padding   = options.fetch(:padding, 1).to_i.abs
        @length    = options.fetch(:length, 70).to_i.abs
      end

      def message_length
        message.to_s.size
      end

      def chopped_message
        message.scan(/.{1,#{( length > message_length ? message_length : length )}}/)
      end

      def chopped_message_length
        chopped_message[0].size
      end

    private

      def iterate_chopped_lines(string = "")
        chopped_message.each{ |line| string += yield line }
        string
      end

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

      def chopping_line(line)
        "\n" if chopped_message.size > 1 && !chopping_last_line?(line)
      end

      def chopping_last_line?(line)
        chopped_message.index(line) == chopped_message.size - 1
      end

      def chopping_padding(line)
        if chopping_last_line?(line)
          first_line = chopped_message.first.size
          last_line  = chopped_message.last.size
          " " * (first_line - last_line) if first_line > last_line
        end
      end

      def vertical_padding
        " " * padding if padding > 0
      end
    end
  end
end
