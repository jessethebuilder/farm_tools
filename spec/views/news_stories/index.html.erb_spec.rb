require 'rails_helper'

RSpec.describe "news_stories/index", type: :view do
  before(:each) do
    assign(:news_stories, [
      NewsStory.create!(
        :title => "Title",
        :content => "MyText",
        :published => false,
        :archived => false,
        :main_news_story_image => "Main News Story Image",
        :writes_news_stories_type => "Writes News Stories Type",
        :writes_news_stories_id => "Writes News Stories"
      ),
      NewsStory.create!(
        :title => "Title",
        :content => "MyText",
        :published => false,
        :archived => false,
        :main_news_story_image => "Main News Story Image",
        :writes_news_stories_type => "Writes News Stories Type",
        :writes_news_stories_id => "Writes News Stories"
      )
    ])
  end

  it "renders a list of news_stories" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Main News Story Image".to_s, :count => 2
    assert_select "tr>td", :text => "Writes News Stories Type".to_s, :count => 2
    assert_select "tr>td", :text => "Writes News Stories".to_s, :count => 2
  end
end
