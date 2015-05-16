module Lumos
  class Message
    attr_reader :original_message, :delimiter, :padding, :length

    def initialize(options = {})
      @original_message = options.fetch(:message)
      @delimiter        = options.fetch(:delimiter, "#").to_s
      @padding          = options.fetch(:padding, 1).to_i.abs
      @length           = options.fetch(:length, 70).to_i.abs
    end

    def original_message_length
      original_message.to_s.size
    end

    def chopped_message
      original_message.scan(/.{1,#{( length > original_message_length ? original_message_length : length )}}/)
    end

    def chopped_message_length
      chopped_message[0].size
    end

  private

    def iterate_chopped_lines(string = "")
      chopped_message.each{ |line| string += yield line }
      string
    end

    def horizontal_line
      delimiter * chopped_message_length
    end

    def horizontal_padding
      "\n" * padding if padding > 0
    end

    def vertical_padding
      " " * padding if padding > 0
    end
  end
end
