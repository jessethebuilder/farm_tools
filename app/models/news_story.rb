class NewsStory < ActiveRecord::Base
  include Bootsy::Container
  extend SaveDraftArchiveDelete

  belongs_to :writes_news_stories, :polymorphic => true

  use_farm_slugs :id_method => :title

  mount_uploader :main_news_story_image, MainNewsStoryImageUploader, :dependent => :destroy
end
