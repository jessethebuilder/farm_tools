class NewsStory < ActiveRecord::Base
  include Bootsy::Container
  extend SaveDraftArchiveDelete
  save_draft_archive_delete

  belongs_to :writes_news_stories, :polymorphic => true

  mount_uploader :main_news_story_image, MainNewsStoryImageUploader

  validates :title, :presence => true
end
