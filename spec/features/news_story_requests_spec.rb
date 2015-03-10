require 'spec_helper'

RSpec.describe 'News Story Requests', :type => :feature do
  #A lot of these specs test SaveDraftArchiveDelete requests as they are the NewsStory Model

  #Many of these test requests related to the existing _form in news_stories/views in the Engine.
  #If you use a different form, consider re-spec.

  let!(:ns){ create :news_story }

  describe 'Index' do

  end

  describe 'Show' do
  end

  describe 'New' do
    let(:test_title){ Faker::Company.bs }

    before(:each) do
      visit '/news_stories/new'
    end

    specify 'it should publish a news story' do
      fill_in 'Title', :with => test_title
      click_button 'Publish'

      #knowing NewsStory uses FarmSlugs
      current_path.should == "/news_stories/#{test_title.parameterize}"
      page.should have_content test_title
    end

    it 'should not save the story, or show it as published if there is a validation error' do
      click_button 'Publish'
      #todo jfx
      page.should have_content "Title can't be blank"
      page.should_not have_content('Status: Published')
      page.should have_content('Status: Draft')
    end
  end

  describe 'Edit' do
    specify 'Publish button should set :published to true and :archived to false' do
       visit "/news_stories/#{ns.id}/edit"
       click_button 'Publish'

       story = NewsStory.find(ns.id)
       story.published.should == true
       story.archived.should == false
     end

     specify 'Draft button should set :published to false and :archived to false' do
       visit "/news_stories/#{ns.id}/edit"
       click_button 'Save Draft'
       ns.published.should == false
       ns.archived.should == false
     end

     ###### Relies on JS alert(). May need webdriver

     # specify 'Archive button should set :published to false and :archived to true' do
     #   visit "/news_stories/#{ns.id}/edit"
     #   page.accept_alert "Archived News Stories will not appear on site. Are you sure?" do
     #    click_button 'Archive'
     #   end
     #   ns.published.should == false
     #   ns.archived.should == true
     # end


     # specify  'Delete button should delete the record' do
     #   visit "/news_stories/#{ns.id}/edit"
     #   page.accept_alert "This will delete #{ns.title} permanently. Are you sure?" do
     #    click_link 'Delete'
     #   end
     #
     #   ns.deleted?.should == true
     # end
  end #end Edit
end