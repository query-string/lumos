module Kernel
  def piupiu_devide(delimiter = "#", iterations = 3)
    p delimiter*iterations.to_i
  end

  def piupiu_wrap(message = nil)
    message.nil? ? piupiu_devide : p("### #{message} ###")
  end
end
