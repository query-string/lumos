module Lumos
  class Wrapper

  # @TODO: Split long messages to lines
  # @TODO: Use single method rather than `lumos_wrap` and `lumos_devide`
  # @TODO: Rewrite README

  attr_reader :message, :delimiter, :position, :padding, :length

    def initialize(message, options = {})
      @message   = message
      @delimiter = options.fetch(:delimiter, "#").to_s
      @position  = options.fetch(:position, :surround).to_sym
      @padding   = options.fetch(:padding, set_default_padding).to_i.abs
      @length    = options.fetch(:length, 140).to_i.abs

      validate_position
    end

    def wrapped_message
      self.send("#{position}_message")
    end

    def surround_message
      "#{surround_line}\n"\
      "#{surround_padding}"\
      "#{iterate_chopped_lines{ |line| "#{surround_body(line)}\n" }}"\
      "#{surround_padding}"\
      "#{surround_line}"
    end

    def left_message
      iterate_chopped_lines do |line|
        "#{delimiter}#{vertical_padding}#{line}"
      end
    end

    def right_message
      iterate_chopped_lines do |line|
        "#{line}#{vertical_padding}#{delimiter}"
      end
    end

    def top_message
      "#{horizontal_line}\n"\
      "#{horizontal_padding}"\
      "#{iterate_chopped_lines{ |line| line }}"
    end

    def bottom_message
      "#{iterate_chopped_lines{ |line| "#{line}\n" }}"\
      "#{horizontal_padding}"\
      "#{horizontal_line}"
    end

    def horizontal_message
      "#{top_message}\n"\
      "#{horizontal_padding}"\
      "#{horizontal_line}"
    end

    def vertical_message
      iterate_chopped_lines do |line|
        "#{delimiter}#{vertical_padding}#{line}#{vertical_padding}#{delimiter}"
      end
    end

    def _message_length
      message.to_s.size
    end

    def _chopped_message
      message.scan(/.{1,#{( length > _message_length ? _message_length : length )}}/)
    end

    def _chopped_message_length
      _chopped_message[0].size
    end

  private

    def set_default_padding
      [:top, :bottom].include?(position) ? 0 : 1
    end

    def validate_position
      positions = [:surround, :left, :right, :top, :bottom, :horizontal, :vertical]
      raise ArgumentError, "#{position} is not correct position. You can use one of following: #{positions.join(", ")}." unless positions.include?(position)
    end

    def iterate_chopped_lines(string = "")
      _chopped_message.each{ |line| string += yield line }
      string
    end

    def surround_line
      "#{delimiter * _chopped_message_length}"\
      "#{padding > 0 ? (delimiter * padding) * 2 : nil}"\
      "#{delimiter * 2}"
    end

    def surround_body(content)
      "#{delimiter}#{vertical_padding}#{content}#{vertical_padding}#{delimiter}"
    end

    def surround_padding
      "#{surround_body(" " * _chopped_message_length)}\n" * padding if padding > 0
    end

    def horizontal_line
      delimiter * _chopped_message_length
    end

    def horizontal_padding
      "\n" * padding if padding > 0
    end

    def vertical_padding
      " " * padding if padding > 0
    end
  end
end
