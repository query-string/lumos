module Lumos
  class TopMessage < Lumos::Message
    def initialize(options = {})
      super
      @padding = options.fetch(:padding, 0).to_i.abs
    end

    def message
      "#{horizontal_line}\n"\
      "#{horizontal_padding}"\
      "#{iterate_chopped_lines{ |line| "#{line}#{chopping_line line}" }}"
    end
  end
end
