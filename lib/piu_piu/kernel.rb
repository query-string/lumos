module Kernel
  def piupiu(message = "")
    p message.empty? ? "###" : "### #{message} ###"
  end
end
