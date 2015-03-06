require 'rails_helper'

RSpec.describe "news_stories/edit", type: :view do
  before(:each) do
    @news_story = assign(:news_story, NewsStory.create!(
      :title => "MyString",
      :content => "MyText",
      :published => false,
      :archived => false,
      :main_news_story_image => "MyString",
      :writes_news_stories_type => "MyString",
      :writes_news_stories_id => "MyString"
    ))
  end

  it "renders the edit news_story form" do
    render

    assert_select "form[action=?][method=?]", news_story_path(@news_story), "post" do

      assert_select "input#news_story_title[name=?]", "news_story[title]"

      assert_select "textarea#news_story_content[name=?]", "news_story[content]"

      assert_select "input#news_story_published[name=?]", "news_story[published]"

      assert_select "input#news_story_archived[name=?]", "news_story[archived]"

      assert_select "input#news_story_main_news_story_image[name=?]", "news_story[main_news_story_image]"

      assert_select "input#news_story_writes_news_stories_type[name=?]", "news_story[writes_news_stories_type]"

      assert_select "input#news_story_writes_news_stories_id[name=?]", "news_story[writes_news_stories_id]"
    end
  end
end
