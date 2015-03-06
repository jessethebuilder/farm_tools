class CreateNewsStories < ActiveRecord::Migration
  def change
    create_table :news_stories do |t|
      t.string :title
      t.text :content
      t.boolean :published, :default => false
      t.boolean :archived, :default => false
      t.string :main_news_story_image
      t.string :writes_news_stories_type
      t.string :writes_news_stories_id

      t.timestamps null: false
    end
  end
end
