# Rails basic template

A Rails 4 basic template.

## Process
1. Application configuration with [figaro](https://github.com/laserlemon/figaro)
2. Add database.yml and application.yml to .gitignore
3. Create database.example.yml and application.example.yml based on the default files
4. Configure [minitest-rails](https://github.com/blowmage/minitest-rails)
5. Use [turn](https://github.com/turn-project/turn)'s dot format for test results
6. Generators configuration: use spec format for minitest and don't generate assets and helpers

## Usage
```sh
rails new APP_PATH -m https://raw.github.com/apod/rails_basic_template/master/template.rb
```
