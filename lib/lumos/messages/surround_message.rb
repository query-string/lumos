module Lumos
  class SurroundMessage < Lumos::Message
    def message
      "#{line}\n"\
      "#{offset}"\
      "#{iterate_chopped_lines{ |string| "#{body(string)}\n" }}"\
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

    def body(string = original_message)
      "#{delimiter}#{vertical_padding}#{string}#{vertical_padding}#{delimiter}"
    end
  end
end
