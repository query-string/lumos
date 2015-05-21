module Kernel
  def lumos_devide(delimiter = "#", iterations = 3)
    print delimiter * iterations.to_i
  end

  def lumos_wrap(message = nil, options = {})
    message.nil? ? print(lumos_devide) : print(Lumos::Wrapper.new(message, options).result)
  end
end
