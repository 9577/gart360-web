unless Rails.env.production?
  namespace :dev do
    namespace :db do
      desc "recreates the development database from migration, and updates the db schema if necessary"
      task seed: :environment do
        require File.dirname(__FILE__) + '/../../db/seeds_for_dev'
      end
    end
  end
end
