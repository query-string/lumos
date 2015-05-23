module Lumos
  class Wrapper
    attr_reader :message, :options, :position

    def initialize(message, options = {})
      @message  = message
      @options  = options
      @position = options.fetch(:position, :surround).to_sym

      validate_position
    end

    def formatter(name = position)
      ("Lumos::Formatters::" + "#{name}".classify).constantize.new(merged_options)
    end

    def result
      formatter.result
    end

    def method_missing(name)
      available_positions.include?(name) ? formatter(name).result : super
    end

  private

    def available_positions
      [:surround, :left, :right, :top, :bottom, :horizontal, :vertical]
    end

    def validate_position
      raise ArgumentError, "#{position} is not correct position. You can use one of following: #{available_positions.join(", ")}." unless available_positions.include?(position)
    end

    def merged_options
      options.except(:position).merge(message: message)
    end
  end
end
