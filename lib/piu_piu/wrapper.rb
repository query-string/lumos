module PiuPiu
  class Wrapper

    attr_reader :message, :delimiter, :position

    def initialize(message, options = {})
      @message   = message
      @delimiter = options.fetch(:delimiter, "#")
      @position  = options.fetch(:position, :surround).to_sym
      # @TODO: Add padding option

      check_position
    end

    def count_chars
      message.to_s.size
    end

    def wrapped_message
      case position
        when :surround
          "#{delimiter} #{message} #{delimiter}"
        when :left
          "#{delimiter} #{message}"
        when :right
          "#{message} #{delimiter}"
        when :top
          "#{delimiter * count_chars}\n"\
          "#{message}"
        when :bottom
          "#{message}\n"\
          "#{delimiter * count_chars}"
      end
    end

  private

    def check_position
      positions = [:left, :right, :top, :bottom, :surround]
      raise ArgumentError, "#{position} is not correct position. You can use one of following: #{positions.join(", ")}." unless positions.include?(position)
    end

  end
end
