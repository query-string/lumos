module Kernel
  def piupiu_devide
    p "###"
  end

  def piupiu_wrap(message = nil)
    p message.nil? ? piupiu_devide : "### #{message} ###"
  end
end
