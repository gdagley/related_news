require 'simple-rss'
require 'open-uri'

class RelatedNewsFeed < ActiveRecord::Base
  belongs_to :newsworthy, :polymorphic => true
  has_many   :related_news_items, :dependent => :destroy
  
  def fetch
    begin
      logger.info "Fetching #{url}..."
      entries = retrieve_feed_entries
      entries.each do |entry|
        unless related_news_items.find_by_url(entry.link)
          news_item = RelatedNewsItem.parse(entry)
          news_item.newsworthy = self.newsworthy
          related_news_items << news_item
        end
      end
    rescue TimeoutError
      logger.warn "Feed timed out"
    end
    save!
  end
  
  def retrieve_feed_entries
    SimpleRSS.parse(open(url.strip)).entries
  end
  
  def self.update_all_feeds
    find(:all).each do |feed|
      feed.fetch
    end
  end
end