# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :application, "education"
set :repo_url, "git@github.com:Caveman21days/education.git"

set :deploy_to, "/home/deployer/education"

set :format, :pretty
set :deploy_user, 'deployer'

append :linked_files, "config/database.yml"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

set :keep_releases, 10

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart
end