module Lumos
  class RightMessage < Lumos::Message
    def message
      iterate_chopped_lines do |line|
        "#{line}#{vertical_padding}#{delimiter}"\
        "#{chopping_line line}"
      end
    end
  end
end
