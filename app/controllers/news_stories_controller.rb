class NewsStoriesController < ApplicationController
  include SaveDraftArchiveDeleteControllerHelper

  before_action :set_news_story, only: [:show, :edit, :update, :destroy]

  # before_action :except => [:index, :show, :more] do |controller|
  #   authenticate_user_level!(controller, 'admin')
  # end

  respond_to :html, :js

  def more
    @news_stories = NewsStory.published
  end

  def index
    set_upcoming_classes
    @news_stories = NewsStory.published.order('updated_at DESC').limit(6)
    respond_with(@news_stories)
  end

  def show
    respond_with(@news_story)
  end

  def new
    @news_story = NewsStory.new
    respond_with(@news_story)
  end

  def edit
  end

  def create
    @news_story = NewsStory.new(news_story_params)

    publish_or_archive(@news_story)

    @news_story.save
    respond_with(@news_story)
  end

  def update
    publish_or_archive(@news_story)


    @news_story.update(news_story_params)
    respond_with(@news_story)
  end

  def destroy
    @news_story.destroy
    notice << "#{@news_story.title} has been destroyed forever"
    respond_with(@news_story)
  end

  private
  def set_news_story
    if p = params[:id]
      @news_story = NewsStory.find(p)
    else
      @news_story = NewsStory.new
    end
  end

  def news_story_params
    params.require(:news_story).permit(:title, :content, :author_id, :published, :archived,
                                       :bootsy_image_gallery_id,
                                       :main_news_story_image, :main_news_story_image_cache, :remote_main_news_story_image_url)
  end
end