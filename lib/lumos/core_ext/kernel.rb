module Kernel
  def lumos(message = nil, *args)
    if message.nil? || message == :>
      lumos_divide args[0], args[1]
    else
      lumos_wrap message, args[0]
    end
  end

private

  def lumos_divide(delimiter, iterations)
    delimiter  ||= "#"
    iterations ||= 3

    print delimiter * iterations.to_i
  end

  def lumos_wrap(message = nil, options)
    options ||= {}
    print Lumos::Wrapper.new(message, options).result + "\n\n"
  end
end
