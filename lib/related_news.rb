module RelatedNews
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def has_related_news
      has_many :related_news_feeds, :as => :newsworthy, :dependent => :destroy
      has_many :related_news_items, :as => :newsworthy
      
      include RelatedNews::InstanceMethods
    end    
  end
  
  module InstanceMethods
    def latest_news_items(limit = 10)
      related_news_items.find(:all, :limit => limit, :order => 'created_at DESC')
    end
    
    def update_news_feeds
      related_news_feeds.each do |feed|
        feed.fetch
      end
    end
  end
end
