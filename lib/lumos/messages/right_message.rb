module Lumos
  class RightMessage < Lumos::Message
    def message
      iterate_chopped_lines do |line|
        "#{line}#{vertical_padding}#{delimiter}"
      end
    end
  end
end
