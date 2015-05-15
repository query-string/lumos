module Lumos
  class Wrapper
    attr_reader :message, :options, :position

    def initialize(message, options = {})
      @message   = message
      @options   = options
      @position  = options.fetch(:position, :surround).to_sym

      validate_position
    end

    def wrapped_class
      ("Lumos::" + "#{position}_message".classify).constantize.new(merged_options)
    end

    def wrapped
      wrapped_class.message
    end

  private

    def validate_position
      positions = [:surround, :left, :right, :top, :bottom, :horizontal, :vertical]
      raise ArgumentError, "#{position} is not correct position. You can use one of following: #{positions.join(", ")}." unless positions.include?(position)
    end

    def merged_options
      options.except(:position).merge(message: message)
    end
  end
end
