ENV['CODECLIMATE_REPO_TOKEN'] = "331d5a46a9d322bb39ba65ac61954d3f5453f7eb20ffd4d3825165cf7a2c19c1"
require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require "active_record"
require "lumos"

RSpec.configure do |config|
  # Use color in STDOUT
  config.color = true

  # Use color not only in STDOUT but also in pagers and files
  config.tty = true

  # Use the specified formatter
  config.formatter = :documentation # :progress, :html, :textmate
end
