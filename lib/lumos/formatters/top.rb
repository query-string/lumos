module Lumos
  module Formatters
    class Top < Lumos::Formatters::Base
      def initialize(options = {})
        super
        @padding = options.fetch(:padding, 0).to_i.abs
      end

      def result
        "#{horizontal_line}\n"\
        "#{horizontal_padding}"\
        "#{iterate_chopped_lines{ |line| "#{line}#{chopping_line line}" }}"
      end
    end
  end
end
