module Kernel
  def piupiu_devide(delimiter = "#", iterations = 3)
    p delimiter*iterations.to_i
  end

  def piupiu_wrap(message = nil, options = {})
    delimiter = options.fetch(:delimiter, "#")
    position  = options.fetch(:position, :surround).to_sym

    message_wrapped = if position == :surround
      "#{delimiter} #{message} #{delimiter}"
    elsif position == :left
      "#{delimiter} #{message}"
    elsif position == :right
      "#{message} #{delimiter}"
    end

    message.nil? ? piupiu_devide : p(message_wrapped)
  end
end
