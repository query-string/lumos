module Kernel
  def piupiu_devide(delimiter = "#", iterations = 3)
    p delimiter*iterations.to_i
  end

  def piupiu_wrap(message = nil, options = {})
    delimiter = options.fetch(:delimiter, "#")
    position  = options.fetch(:position, :surround).to_sym

    # Change to
    message_wrapped = case position
      when :surround
        "#{delimiter} #{message} #{delimiter}"
      when :left
        "#{delimiter} #{message}"
      when :right
        "#{message} #{delimiter}"
    end

    message.nil? ? piupiu_devide : p(message_wrapped)
  end
end
