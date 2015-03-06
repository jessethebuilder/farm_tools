require 'rails_helper'

RSpec.describe "news_stories/show", type: :view do
  before(:each) do
    @news_story = assign(:news_story, NewsStory.create!(
      :title => "Title",
      :content => "MyText",
      :published => false,
      :archived => false,
      :main_news_story_image => "Main News Story Image",
      :writes_news_stories_type => "Writes News Stories Type",
      :writes_news_stories_id => "Writes News Stories"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Main News Story Image/)
    expect(rendered).to match(/Writes News Stories Type/)
    expect(rendered).to match(/Writes News Stories/)
  end
end
