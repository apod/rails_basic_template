# Gems
gem 'figaro'

# Setup figaro
file 'config/application.yml', <<-END
HOST: 'localhost:3000'
END

# Ignore application specific files
run "cp config/database.yml config/database.example.yml"
run "cp config/application.yml config/application.example.yml"
run "echo '
# Ignore application specific files.
config/database.yml
config/application.yml' >> .gitignore"
