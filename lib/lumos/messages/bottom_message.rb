module Lumos
  class BottomMessage < Lumos::Message
    def initialize(options = {})
      super
      @padding = options.fetch(:padding, 0).to_i.abs
    end

    def message
      "#{iterate_chopped_lines{ |line| "#{line}\n" }}"\
      "#{horizontal_padding}"\
      "#{horizontal_line}"
    end
  end
end
