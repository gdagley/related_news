class RelatedNewsItem < ActiveRecord::Base
  belongs_to :related_news_feed
  
  def self.parse(entry)
    title       = entry.title
    url         = entry.link
    description = entry.description
    
    RelatedNewsItem.new(:title => title, :url => url, :description => description)    
  end
end