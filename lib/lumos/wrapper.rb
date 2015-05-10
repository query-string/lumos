module Lumos
  class Wrapper

  # @TODO: Split long messages to lines
  # @TODO: Use single method rather than `lumos_wrap` and `lumos_devide`

  attr_reader :message, :delimiter, :position, :padding

    def initialize(message, options = {})
      @message   = message
      @delimiter = options.fetch(:delimiter, "#").to_s
      @position  = options.fetch(:position, :surround).to_sym
      @padding   = options.fetch(:padding, set_default_padding).to_i.abs

      validate_position
    end

    def count_chars
      message.to_s.size
    end

    def wrapped_message
      self.send("#{position}_message")
    end

    def surround_message
      "#{surround_line}\n"\
      "#{surround_padding}"\
      "#{surround_body}\n"\
      "#{surround_padding}"\
      "#{surround_line}"
    end

    def left_message
      "#{delimiter}#{vertical_padding}#{message}"
    end

    def right_message
      "#{message}#{vertical_padding}#{delimiter}"
    end

    def top_message
      "#{horizontal_line}\n"\
      "#{horizontal_padding}"\
      "#{message}"
    end

    def bottom_message
      "#{message}\n"\
      "#{horizontal_padding}"\
      "#{horizontal_line}"
    end

    def horizontal_message
      "#{top_message}\n"\
      "#{horizontal_padding}"\
      "#{horizontal_line}"
    end

    def vertical_message
      "#{delimiter}#{vertical_padding}#{message}#{vertical_padding}#{delimiter}"
    end

  private

    def set_default_padding
      [:top, :bottom].include?(position) ? 0 : 1
    end

    def validate_position
      positions = [:surround, :left, :right, :top, :bottom, :horizontal, :vertical]
      raise ArgumentError, "#{position} is not correct position. You can use one of following: #{positions.join(", ")}." unless positions.include?(position)
    end

    def surround_line
      "#{delimiter * count_chars}"\
      "#{padding > 0 ? (delimiter * padding) * 2 : nil}"\
      "#{delimiter * 2}"
    end

    def surround_body(content = message)
      "#{delimiter}#{vertical_padding}#{content}#{vertical_padding}#{delimiter}"
    end

    def surround_padding
      "#{surround_body(" " * count_chars)}\n" * padding if padding > 0
    end

    def horizontal_line
      delimiter * count_chars
    end

    def horizontal_padding
      "\n" * padding if padding > 0
    end

    def vertical_padding
      " " * padding if padding > 0
    end
  end
end
