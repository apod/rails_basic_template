# Gems
gem 'figaro'
gem 'slim-rails'

gem_group :development do
  gem 'pry-rails'
  gem 'thin'
  gem 'quiet_assets'
  gem 'better_errors'
  gem 'binding_of_caller'
end

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

# Ignore application specific files
run 'cp config/database.yml config/database.example.yml'
run 'cp config/application.yml config/application.example.yml'
run "echo '
# Ignore application specific files.
config/database.yml
config/application.yml' >> .gitignore"

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

# Create application.html.slim
remove_file 'app/views/layouts/application.html.erb'
file 'app/views/layouts/application.html.slim', <<-END
doctype html
html
  head
    title #{app_const_base}
    meta charset = 'utf-8'

    = stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track' => true
    = javascript_include_tag 'application',               'data-turbolinks-track' => true

    = csrf_meta_tags
  body
    = yield
END
