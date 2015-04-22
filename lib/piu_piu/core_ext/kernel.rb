module Kernel
  def piupiu_devide
    p "###"
  end

  def piupiu_wrap(message = nil)
    message.nil? ? piupiu_devide : p("### #{message} ###")
  end
end
