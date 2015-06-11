module Lumos
  module Formatters
    module BaseChopper
      def chopped_message
        message.scan(/.{1,#{( length > message_length ? message_length : length )}}/)
      end

      def chopped_message_length
        chopped_message[0].size
      end

      def iterate_chopped_lines(string = "")
        chopped_message.each{ |line| string += yield line }
        string
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
    end
  end
end
