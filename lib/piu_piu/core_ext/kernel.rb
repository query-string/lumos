module Kernel
  def piupiu_devide(devider = "#")
    p devider*3
  end

  def piupiu_wrap(message = nil)
    message.nil? ? piupiu_devide : p("### #{message} ###")
  end
end
