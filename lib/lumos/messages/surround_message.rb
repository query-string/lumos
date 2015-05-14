module Lumos
  class SurroundMessage < Lumos::Message

    def message
      "#{message_line}\n"\
      "#{message_padding}"\
      "#{iterate_chopped_lines{ |line| "#{message_body(line)}\n" }}"\
      "#{message_padding}"\
      "#{message_line}"
    end

    def message_line
      "#{delimiter * chopped_message_length}"\
      "#{padding > 0 ? (delimiter * padding) * 2 : nil}"\
      "#{delimiter * 2}"
    end

    def message_padding
      "#{message_body(" " * chopped_message_length)}\n" * padding if padding > 0
    end

    def message_body(string)
      "#{delimiter}#{vertical_padding}#{string}#{vertical_padding}#{delimiter}"
    end

  end
end
