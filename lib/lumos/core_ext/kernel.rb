module Kernel
  def lumos(*args)
    string      = args[0]
    options     = args[1]
    method_name = options.is_a?(Hash) ? "lumos_wrap" : "lumos_devide"

    self.send(method_name, string, options)
  end

private

  def lumos_devide(delimiter, iterations)
    delimiter  = "#" if delimiter.nil?
    iterations = 3 if iterations.nil?
    print delimiter * iterations.to_i
  end

  def lumos_wrap(message = nil, options = {})
    print Lumos::Wrapper.new(message, options).result
  end
end
