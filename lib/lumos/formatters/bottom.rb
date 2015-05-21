module Lumos
  module Formatters
    class Bottom < Lumos::Formatters::Base
      def initialize(options = {})
        super
        @padding = options.fetch(:padding, 0).to_i.abs
      end

      def message
        "#{iterate_chopped_lines{ |line| "#{line}\n" }}"\
        "#{horizontal_padding}"\
        "#{horizontal_line}"
      end
    end
  end
end
