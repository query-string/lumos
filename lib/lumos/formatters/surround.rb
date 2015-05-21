module Lumos
  module Formatters
    class Surround < Lumos::Formatters::Base
      def result
        "#{line}\n"\
        "#{offset}"\
        "#{iterate_chopped_lines{ |line| "#{body(line)}\n" }}"\
        "#{offset}"\
        "#{line}"
      end

      def line
        "#{delimiter * chopped_message_length}"\
        "#{padding > 0 ? (delimiter * padding) * 2 : nil}"\
        "#{delimiter * 2}"
      end

      def offset
        "#{body(" " * chopped_message_length)}\n" * padding if padding > 0
      end

      def body(line = message)
        "#{delimiter}#{vertical_padding}#{line}#{vertical_padding}#{chopping_padding line}#{delimiter}"
      end
    end
  end
end
