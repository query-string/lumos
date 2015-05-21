module Lumos
  module Formatters
    class Right < Lumos::Formatters::Base
      def message
        iterate_chopped_lines do |line|
          "#{line}#{vertical_padding}#{chopping_padding line}#{delimiter}"\
          "#{chopping_line line}"
        end
      end
    end
  end
end
