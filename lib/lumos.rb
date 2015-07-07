require "active_support/core_ext/string"

%w(base_chopper base_horizontal base surround left right top bottom horizontal vertical).each do |file|
  require File.dirname(__FILE__) + "/lumos/formatters/#{file}"
end

require "lumos/wrapper"
require "lumos/core_ext/kernel"
require "lumos/version"

require "lumos/railtie" if defined?(Rails)
