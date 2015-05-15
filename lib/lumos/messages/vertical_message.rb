module Lumos
  class VerticalMessage < Lumos::Message
    def message
      iterate_chopped_lines do |line|
        "#{delimiter}#{vertical_padding}#{line}#{vertical_padding}#{delimiter}"
      end
    end
  end
end
