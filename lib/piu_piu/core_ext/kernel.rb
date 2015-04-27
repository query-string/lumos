module Kernel
  def piupiu_devide(delimiter = "#", iterations = 3)
    p delimiter*iterations.to_i
  end

  def piupiu_wrap(message = nil, options = {})
    delimiter = options.fetch(:delimiter, "#")
    position  = options.fetch(:position, :surround).to_sym

    check_position position

    message_wrapped = case position
      when :surround
        "#{delimiter} #{message} #{delimiter}"
      when :left
        "#{delimiter} #{message}"
      when :right
        "#{message} #{delimiter}"
    end

    message.nil? ? piupiu_devide : p(message_wrapped)
  end

private

  def check_position(position)
    positions = %i(left right top bottom surround)
    raise ArgumentError, "#{position} is not correct position. You can use one of following: #{positions.join(", ")}." unless positions.include?(position)
  end
end
