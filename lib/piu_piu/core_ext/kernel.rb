module Kernel
  def piupiu_devide(delimiter = "#", iterations = 3)
    print delimiter * iterations.to_i
  end

  def piupiu_wrap(message = nil, options = {})
    message.nil? ? print(piupiu_devide) : print(PiuPiu::Wrapper.new(message, options).wrapped_message)
  end
end
