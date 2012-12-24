# lib/tasks/prepare.rake
namespace :db do
  desc "drop, crate, migrate and seed"
  task :prepare => [:drop,:create,:migrate,:seed] do
  end
end