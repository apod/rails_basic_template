# Rails basic template

A Rails 4 basic template.

## Process
1. Application configuration with [figaro](https://github.com/laserlemon/figaro)
2. Add database.yml and application.yml to .gitignore
3. Create database.example.yml and application.example.yml based on the default files
4. Configure [minitest-rails](https://github.com/blowmage/minitest-rails)
5. Use [turn](https://github.com/turn-project/turn)'s dot format for test results
6. Generators configuration: use spec format for minitest and don't generate assets and helpers
7. [Slim](http://slim-lang.com/) as the default template engine (using [slim-rails](https://github.com/slim-template/slim-rails))
  - Remove application.html.erb and create application.html.slim
  - Pretty html output on development (`Slim::Engine.set_default_options pretty: true`)
8. Development goodies
  - [Pry](http://pryrepl.org/) as console and debugger (using [pry-rails](https://github.com/rweng/pry-rails))
  - [Thin](https://github.com/macournoyer/thin/) as development server
  - Mute asset logging with [quiet_assets](https://github.com/evrone/quiet_assets)
  - [Better Errors](https://github.com/charliesome/better_errors)

## Usage
```sh
rails new my_app -d postgresql -T -m https://raw.github.com/apod/rails_basic_template/master/template.rb
```
