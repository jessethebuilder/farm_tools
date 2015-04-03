class AddExcerptToNewsStories < ActiveRecord::Migration
  def change
    add_column :news_stories, :excerpt, :text
  end
end
