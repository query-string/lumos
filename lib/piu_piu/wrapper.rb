module PiuPiu
  class Wrapper

    attr_reader :message, :delimiter, :position

    def initialize(message, options)
      @message   = message
      @delimiter = options.fetch(:delimiter, "#")
      @position  = options.fetch(:position, :surround).to_sym

      check_position
      puts_message
    end

    def wrapped_message
      case position
        when :surround
          "#{delimiter} #{message} #{delimiter}"
        when :left
          "#{delimiter} #{message}"
        when :right
          "#{message} #{delimiter}"
      end
    end

  private

    def check_position
      positions = [:left, :right, :top, :bottom, :surround]
      raise ArgumentError, "#{position} is not correct position. You can use one of following: #{positions.join(", ")}." unless positions.include?(position)
    end

    def puts_message
      message.nil? ? piupiu_devide : p(wrapped_message)
    end

  end
end