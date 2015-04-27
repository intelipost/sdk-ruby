require 'simplecov'
require 'dotenv'

SimpleCov.start do
  add_filter '/spec'
end if ENV["COVERAGE"]

require File.expand_path("../../lib/intelipost", __FILE__)
require 'intelipost'
require 'vcr'

Dotenv.load

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
end

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.order = "random"
end
