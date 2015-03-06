class AddSlugToNewsStory < ActiveRecord::Migration
  def change
    add_column :news_stories, :slug, :string
  end
end
