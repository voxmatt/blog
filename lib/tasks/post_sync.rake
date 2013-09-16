require 'post_importer'

namespace :post_importer do
  desc 'sync all markdown posts'
  task :sync => :environment do
    PostImporter.import_posts('public/files/')
    puts "There are now #{Post.count} posts"
  end
end