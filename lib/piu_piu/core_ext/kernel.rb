module Kernel
  def piupiu_devide(delimiter = "#", iterations = 3)
    p delimiter*iterations.to_i
  end

  def piupiu_wrap(message = nil, options = {})
    delimiter = options.fetch(:delimiter, "#")
    message.nil? ? piupiu_devide : p("#{delimiter*3} #{message} #{delimiter*3}")
  end
end
