module Lumos
  module Formatters
    class Horizontal < Lumos::Formatters::Base
      def initialize(options = {})
        super
        @padding = options.fetch(:padding, 0).to_i.abs
      end

      def message
        "#{horizontal_line}\n"\
        "#{horizontal_padding}"\
        "#{iterate_chopped_lines{ |line| "#{line}\n" }}"\
        "#{horizontal_padding}"\
        "#{horizontal_line}"
      end
    end
  end
end
