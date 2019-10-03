[![Gem Version](https://badge.fury.io/rb/capistrano-anycable.svg)](https://rubygems.org/gems/capistrano-anycable) [![Build Status](https://travis-ci.org/anycable/capistrano-anycable.svg?branch=master)](https://travis-ci.org/anycable/capistrano-anycable)
[![Documentation](https://img.shields.io/badge/docs-link-brightgreen.svg)](https://docs.anycable.io/#capistrano)


# Capistrano::Anycable

AnyCable integration for Capistrano.

# Requirements

AnyCable >= 0.6.2

## Installation

Add those lines to your application's Gemfile:

```ruby
# To run daemonized `anycabled`
gem "daemons", "~> 1.3", require: false

gem "capistrano-anycable", group: :development
```

And then execute:

```
$ bundle
```

## Usage

```ruby
# Capfile
require "capistrano/anycable"
```

## Configuration

Available configuration options (with defaults):

```ruby
# Restart AnyCable after `deploy:restart` phase
set :anycable_default_hooks, true

# Capistrano roles to start AnyCable on
set :anycable_roles, :app
# Path to the root of your application
set :anycable_path, -> { release_path }
# Command to start AnyCable
set :anycable_command, -> { [:bundle, :exec, :anycabled] }

# Sets RAILS_ENV for AnyCable process
set :anycable_env, -> { fetch(:rack_env, fetch(:rails_env, fetch(:stage))) }
# AnyCable configuration parameters passed through enviroment,
# see https://docs.anycable.io/#/ruby/configuration?id=parameters
set :anycable_environment_variables, {}
# Path to anycable.yml
set :anycable_conf, nil
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/anycable/capistrano-anycable.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
