require "rumoji"

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

    print (Lumos::Formatters::Base.string_to_emoji(delimiter) * iterations.to_i) + "\n"
  end

  def lumos_wrap(message = nil, options)
    options           ||= {}
    options[:delimiter] = options[:delimiter] if options[:delimiter]

    print Lumos::Wrapper.new(message, options).result + "\n"
  end
end
