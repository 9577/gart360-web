puts 'Clean database...'
require 'database_cleaner'

puts '> clean database...'
DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

puts 'Create mandatory data...'
require  Rails.root.join('db', 'seeds_mandatory')