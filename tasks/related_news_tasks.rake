namespace :related_news do
  desc "Update all news feeds"
  task :update_feeds => :environment do
    RelatedNewsFeed.update_all_feeds
  end
end
