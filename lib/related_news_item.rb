class RelatedNewsItem < ActiveRecord::Base
  belongs_to :newsworthy, :polymorphic => true
  belongs_to :related_news_feed
  
  def self.parse(entry)
    title       = entry.title
    url         = entry.link
    description = entry.description
    content     = entry.content
    
    RelatedNewsItem.new(:title => title, :url => url, :description => description, :content => content)    
  end
end