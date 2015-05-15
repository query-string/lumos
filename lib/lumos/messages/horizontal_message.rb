module Lumos
  class HorizontalMessage < Lumos::Message
    def message
      "#{horizontal_line}"\
      "#{horizontal_padding}"\
      "#{iterate_chopped_lines{ |line| line }}"\
      "#{horizontal_padding}"\
      "#{horizontal_line}"
    end
  end
end
