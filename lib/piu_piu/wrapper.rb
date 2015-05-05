module PiuPiu
  class Wrapper

    attr_reader :message, :delimiter, :position, :padding

    def initialize(message, options = {})
      @message   = message
      @delimiter = options.fetch(:delimiter, "#")
      @position  = options.fetch(:position, :surround).to_sym
      @padding   = options.fetch(:padding, 0).to_i

      # @TODO: Simplify wrapped message
      # @TODO: Add padding 1 by default
      # @TODO: Horizontal alignment
      # @TODO: Vertical alignment

      # @TODO: Add padding validation
      # @TODO: Add delimiter validation

      validate_position
    end

    def count_chars
      message.to_s.size
    end

    def wrapped_message
      case position
        when :surround
          "#{surround_line}\n"\
          "#{delimiter}#{vertical_padding}#{message}#{vertical_padding}#{delimiter}\n"\
          "#{surround_line}"
        when :left
          "#{delimiter}#{vertical_padding}#{message}"
        when :right
          "#{message}#{vertical_padding}#{delimiter}"
        when :top
          "#{horizontal_line}\n"\
          "#{horizontal_padding}"\
          "#{message}"
        when :bottom
          "#{message}\n"\
          "#{horizontal_padding}"\
          "#{horizontal_line}"
      end
    end

  private

    def validate_position
      positions = [:left, :right, :top, :bottom, :surround]
      raise ArgumentError, "#{position} is not correct position. You can use one of following: #{positions.join(", ")}." unless positions.include?(position)
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
