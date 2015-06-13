class AddKeywordsToNewsStory < ActiveRecord::Migration
  def change
    add_column :news_stories, :keywords, :text
  end
end
