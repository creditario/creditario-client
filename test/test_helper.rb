# frozen_string_literal: true

require "irb"

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "creditario/client"

require "minitest/autorun"
require "webmock/minitest"

Dir["./test/support/**/*"].each { |f| require f }
