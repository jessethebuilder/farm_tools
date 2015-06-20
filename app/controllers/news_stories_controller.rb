class NewsStoriesController < ApplicationController
  #These routes work for creating simple news stories. If you need to change these routes, just put
  #controllers/news_stories_controller.rb in your app folder. Cut and paste this for a template if you like.

  #The only changes to the standard rails scaffold controller are noted

  before_action :set_news_story, only: [:show, :edit, :update, :destroy]

  respond_to :html, :js

  def index
    @news_stories = NewsStory.all
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
    @news_story.save

    #for SaveDraftArchiveDelete
    @news_story.commit = parse_commit

    respond_with(@news_story)
  end

  def update
    @news_story.update(news_story_params)

    #for SaveDraftArchiveDelete
    @news_story.commit = parse_commit

    respond_with(@news_story)
  end

  def destroy
    @news_story.destroy
    #Stylistic choice. Strictly optional.
    notice << "#{@news_story.title} has been destroyed forever"
    respond_with(@news_story)
  end

  private
  def set_news_story
    @news_story = NewsStory.find(params[:id])
  end

  def parse_commit
    #for SaveDraftArchiveDelete
    case params[:commit]
      when 'Save Draft'
        :draft
      when 'Publish'
        :publish
      when 'Archive'
        :archive
    end
  end

  def news_story_params
    params.require(:news_story).permit(:title, :content,
                                       :writes_news_stories_id, :writes_news_stories_type,
                                       :bootsy_image_gallery_id,
                                       :main_news_story_image, :main_news_story_image_cache, :remote_main_news_story_image_url)
  end
end