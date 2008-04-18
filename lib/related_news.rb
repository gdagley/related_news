module RelatedNews
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def has_related_news
      has_many :related_news_feeds, :as => :newsworthy, :dependent => :destroy
      include RelatedNews::InstanceMethods
    end    
  end
  
  module InstanceMethods
    def latest_news_items(count = 10)
      "newest #{count} news items"
    end
    
    def update_news_feeds
      related_news_feeds.each do |feed|
        feed.fetch
      end
    end
  end
end
