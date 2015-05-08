module Lumos
  class Wrapper

    attr_reader :message, :delimiter, :position, :padding

    def initialize(message, options = {})
      @message   = message
      @delimiter = options.fetch(:delimiter, "#")
      @position  = options.fetch(:position, :surround).to_sym
      @padding   = options.fetch(:padding, 0).to_i

      # @TODO: Vertical alignment

      # @TODO: Add padding 1 by default
      # @TODO: Add padding validation
      # @TODO: Add delimiter validation

      # @TODO: Split long strings to lines

      validate_position
    end

    def count_chars
      message.to_s.size
    end

    def wrapped_message
      self.send("#{position}_message")
    end

  private

    def validate_position
      positions = [:surround, :left, :right, :top, :bottom, :horizontal, :vertical]
      raise ArgumentError, "#{position} is not correct position. You can use one of following: #{positions.join(", ")}." unless positions.include?(position)
    end

    def surround_message
      "#{surround_line}\n"\
      "#{delimiter}#{vertical_padding}#{message}#{vertical_padding}#{delimiter}\n"\
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

    def surround_line
      "#{delimiter * count_chars}"\
      "#{padding > 0 ? (delimiter * padding) * 2 : nil}"\
      "#{delimiter * 2}"
    end

    def horizontal_line
      delimiter * count_chars
    end

    def horizontal_padding
      padding > 0 ? "\n" * padding : nil
    end

    def vertical_padding
      padding > 0 ? " " * padding : nil
    end
  end
end
