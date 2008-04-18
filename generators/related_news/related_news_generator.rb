class RelatedNewsGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      m.migration_template 'migrate/add_related_news.rb', 'db/migrate'
    end
  end
  
  def file_name
    "add_related_news"
  end
end