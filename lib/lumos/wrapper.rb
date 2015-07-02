module Lumos
  class Wrapper
    attr_reader :message, :options, :position

    def self.default_options
      @default_options ||= {
          position:  :surround,
          delimiter: "#",
          padding:   1,
          length:    70
      }
    end

    def initialize(message, options = {})
      options = self.class.default_options.merge(options)

      @options  = options
      @position = options[:position].to_sym
      @message  = message

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
