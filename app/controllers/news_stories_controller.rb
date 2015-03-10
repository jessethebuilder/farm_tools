class NewsStoriesController < ApplicationController
  include SaveDraftArchiveDeleteControllerHelper
  # include HtmlTools
  # include HtmlParts

  before_action :set_news_story, only: [:show, :edit, :update, :destroy]

  respond_to :html, :js

  def index
    @news_stories = NewsStory.published.order('updated_at DESC')
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
    @news_story.commit = params[:commit].downcase.to_sym

    @news_story.save
    respond_with(@news_story)
  end

  def update
    @news_story.commit = params[:commit].downcase.to_sym

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
    # if p = params[:id]
      @news_story = NewsStory.find(p)
    # else
    #   @news_story = NewsStory.new
    # end
  end

  def news_story_params
    params.require(:news_story).permit(:title, :content,
                                       :bootsy_image_gallery_id,
                                       :main_news_story_image, :main_news_story_image_cache, :remote_main_news_story_image_url)
  end
end