module Kernel
  def piupiu_devide(delimiter = "#", iterations = 3)
    p delimiter*iterations.to_i
  end

  def piupiu_wrap(message = nil, options = {})
    PiuPiu::Wrapper.new(message, options)
  end
end
