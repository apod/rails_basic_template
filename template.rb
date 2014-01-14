# Gems
gem 'figaro'

gem_group :development, :test do
  gem 'minitest-rails'
end

gem_group :test do
  gem 'turn'
end

# Setup figaro
file 'config/application.yml', <<-END
HOST: 'localhost:3000'
END

# Setup minitest-rails and turn
file 'test/test_helper.rb', <<-END
ENV['RAILS_ENV'] = 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

require 'minitest/rails'

Turn.config.format = :dot

class ActiveSupport::TestCase
  fixtures :all
end

module Minitest::Expectations
end
END

# Use spec format for minitest and don't generate assets and helpers
environment <<-END
# Use spec format for minitest and don't generate assets and helpers
    config.generators do |g|
      g.test_framework :mini_test, spec: true, fixture: false
      g.assets         false
      g.helper         false
    end
END


# Ignore application specific files
run "cp config/database.yml config/database.example.yml"
run "cp config/application.yml config/application.example.yml"
run "echo '
# Ignore application specific files.
config/database.yml
config/application.yml' >> .gitignore"
