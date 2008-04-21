class AddRelatedNews < ActiveRecord::Migration
  def self.up
    create_table :related_news_feeds, :force => true do |t|
      t.string :newsworthy_type
      t.string :newsworthy_id
      t.string :url

      t.timestamps
    end

    create_table :related_news_items, :force => true do |t|
      t.string  :newsworthy_type
      t.string  :newsworthy_id
      t.integer :related_news_feed_id
      t.string  :title
      t.string  :url
      t.text    :description
      t.text    :content
      
      t.timestamps
    end
  end

  def self.down
    drop_table :related_news_items
    drop_table :related_news_feeds
  end
end
