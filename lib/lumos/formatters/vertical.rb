module Lumos
  module Formatters
    class Vertical < Lumos::Formatters::Base
      def message
        iterate_chopped_lines do |line|
          "#{delimiter}#{vertical_padding}#{line}#{vertical_padding}#{chopping_padding line}#{delimiter}"\
          "#{chopping_line line}"
        end
      end
    end
  end
end
