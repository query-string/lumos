ENV['CODECLIMATE_REPO_TOKEN'] = "30676ff831772153d0238cd5ccbab7b8044a17d57c2878b07aa04904e7246328"
require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require "piu_piu"

RSpec.configure do |config|
  # Use color in STDOUT
  config.color = true

  # Use color not only in STDOUT but also in pagers and files
  config.tty = true

  # Use the specified formatter
  config.formatter = :documentation # :progress, :html, :textmate
end
