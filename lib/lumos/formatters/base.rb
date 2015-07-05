module Lumos
  module Formatters
    class Base
      include BaseChopper
      include BaseHorizontal

      attr_reader :message, :delimiter, :padding, :length

      def self.string_to_emoji(delimiter)
        emoji = delimiter.scan(/\:.*?\:/)
        emoji.size > 0 ? emoji.map{|string| Rumoji.decode(string)}.join("") : delimiter
      end

      def initialize(options = {})
        @message   = unwrap_message options.fetch(:message)
        @padding   = options.fetch(:padding, 1).to_i.abs
        @delimiter = Lumos::Formatters::Base.string_to_emoji options[:delimiter].to_s
        @length    = options[:length].to_i.abs
      end

      def message_length
        message.to_s.size
      end

    private

      def unwrap_message(message)
        object_id_hex = (message.object_id << 1).to_s(16)
        message.to_s.include?(object_id_hex) ? message.inspect : message.to_s
      end

      def vertical_padding
        " " * padding if padding > 0
      end
    end
  end
end
