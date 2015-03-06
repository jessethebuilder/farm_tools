class NewsStory < ActiveRecord::Base
  include Bootsy::Container
  extend SaveDraftArchiveDelete

  save_draft_archive_delete
  use_farm_slugs

  belongs_to :writes_news_stories, :polymorphic => true

  mount_uploader :main_news_story_image, MainNewsStoryImageUploader, :dependent => :destroy

  validates :title, :presence => true
end
