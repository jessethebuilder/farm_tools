class NewsStory < ActiveRecord::Base
  include Bootsy::Container
  extend SaveDraftArchiveDelete

  belongs_to :writes_news_stories, :polymorphic => true

  save_draft_archive_delete
  #todo move this to save_draft_archive_delete
  skip_callback :validate, :commit => :draft


  use_farm_slugs :id_method => :title

  mount_uploader :main_news_story_image, MainNewsStoryImageUploader, :dependent => :destroy
end
