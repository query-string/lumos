module Lumos
  module Formatters
    class Left < Lumos::Formatters::Base
      def message
        iterate_chopped_lines do |line|
          "#{delimiter}#{vertical_padding}#{line}"\
          "#{chopping_line line}"
        end
      end
    end
  end
end
