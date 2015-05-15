module Lumos
  class BottomMessage < Lumos::Message
    def message
      "#{iterate_chopped_lines{ |line| "#{line}\n" }}"\
      "#{horizontal_padding}"\
      "#{horizontal_line}"
    end

  private

    def padding
      0
    end
  end
end
