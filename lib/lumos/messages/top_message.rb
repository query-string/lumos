module Lumos
  class TopMessage < Lumos::Message
    def message
      "#{horizontal_line}\n"\
      "#{horizontal_padding}"\
      "#{iterate_chopped_lines{ |line| line }}"
    end

  private

    def padding
      0
    end

  end
end
