module PiuPiu
  class Wrapper

    attr_reader :message, :delimiter, :position, :padding

    def initialize(message, options = {})
      @message   = message
      @delimiter = options.fetch(:delimiter, "#")
      @position  = options.fetch(:position, :surround).to_sym
      @padding   = options.fetch(:padding, 0).to_i

      # @TODO: Add paddings for different alignment types
      # @TODO: Add padding 1 by default
      # @TODO: Horizontal alignment
      # @TODO: Vertical alignment

      # @TODO: Add padding validation
      # @TODO: Add delimiter validation

      check_position
    end

    def count_chars
      message.to_s.size
    end

    def delimiter_line
      # Returns line of delimiters + defined padding
      "#{delimiter * count_chars}#{delimiter_padding}"
    end

    def wrapped_message
      case position
        when :surround
          "#{delimiter}#{delimiter_line}#{delimiter}\n"\
          "#{delimiter}#{whitespace_padding}#{message}#{whitespace_padding}#{delimiter}\n"\
          "#{delimiter}#{delimiter_line}#{delimiter}"\
        when :left
          "#{delimiter} #{message}"
        when :right
          "#{message} #{delimiter}"
        when :top
          "#{horizontal_delimiter}\n"\
          "#{horizontal_padding}"\
          "#{message}"
        when :bottom
          "#{message}\n"\
          "#{horizontal_padding}"\
          "#{horizontal_delimiter}"
      end
    end

  private

    def check_position
      positions = [:left, :right, :top, :bottom, :surround]
      raise ArgumentError, "#{position} is not correct position. You can use one of following: #{positions.join(", ")}." unless positions.include?(position)
    end

    def delimiter_padding
      padding > 0 ? "#{(delimiter * padding) * 2}" : nil
    end

    def whitespace_padding
      padding > 0 ? "#{" " * padding}" : nil
    end

    def horizontal_delimiter
      delimiter * count_chars
    end

    def horizontal_padding
      padding > 0 ? "\n" * padding : nil
    end
  end
end
