ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"
# START:edit:3

# Set up Sidekiq testing modes. See
# https://github.com/mperham/sidekiq/wiki/Testing
require "sidekiq/testing"
# END:edit:3

require "support/confidence_check"

class ActiveSupport::TestCase
  include TestSupport::ConfidenceCheck
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
