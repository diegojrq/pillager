# lib/tasks/prepare.rake
namespace :db do
  desc "drop, create, migrate and seed"
  task :prepare => [:drop,:create,:migrate,:seed] do
  end
end