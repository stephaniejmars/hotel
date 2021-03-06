# Add simplecov
require 'simplecov'

SimpleCov.start do
  add_filter 'test/manager_test'
  add_filter 'test/reservation_test'
  add_filter 'test/room_test'
end

require "minitest"
require "minitest/autorun"
require "minitest/reporters"


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative '../lib/manager'
require_relative '../lib/reservation'
require_relative '../lib/room'
