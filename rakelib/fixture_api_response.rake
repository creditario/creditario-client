# frozen_string_literal: true

require_relative "fixture_api_response.rb"

namespace :fixture_api_response do
  desc "Create fixture from a request to server local e.g: http://localhost:[port]"
  task :generate do
    FixtureAPIResponse.new
  end
end
