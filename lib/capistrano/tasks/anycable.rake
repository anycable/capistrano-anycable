# frozen_string_literal: true

namespace :load do
  task :defaults do
    set :anycable_default_hooks, true

    set :anycable_roles, :app
    set :anycable_path, -> { release_path }
    set :anycable_command, -> { [:bundle, :exec, :anycabled] }

    set :anycable_env, -> { fetch(:rack_env, fetch(:rails_env, fetch(:stage))) }
    set :anycable_environment_variables, {}
    set :anycable_conf, nil

    # For internal use only
    set :_anycable_environment, -> do
      fetch(:default_env).merge(fetch(:anycable_environment_variables)).merge(
        {
          rails_env: fetch(:anycable_env),
          anycable_conf: fetch(:anycable_conf)
        }.compact
      )
    end
  end
end

namespace :deploy do
  before :starting, :check_anycable_hooks do
    invoke "anycable:add_default_hooks" if fetch(:anycable_default_hooks)
  end
end

namespace :anycable do
  task :add_default_hooks do
    after "deploy:restart", "anycable:restart"
  end

  desc "Start anycable process"
  task :start do
    anycabled :start
  end

  desc "Stop anycable process"
  task :stop do
    anycabled :stop
  end

  desc "Restart anycable process"
  task :restart do
    anycabled :restart
  end

  def anycabled(command)
    on roles fetch(:anycable_roles) do
      within fetch(:anycable_path) do
        with fetch(:_anycable_environment) do
          execute(*fetch(:anycable_command), command)
        end
      end
    end
  end
end
