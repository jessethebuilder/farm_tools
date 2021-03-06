require 'spec_helper'

describe 'Farm Slug Requests', :type => :feature do
  Capybara.default_selector = :css
  #requests are based on typical Rails Scaffolding, as it was auto-generated by Rails 4.2.

  #reqeusts use a Model called FarmSlugTestObject and it has two attributes:
  # :caption, which is the :id_method; and :url_slug, which is the :slug_method

  let(:test_name){ 'The Name of Some Object or Article'}

  before(:each) do
  end

  describe 'Creating an Record that uses Farm Slugs' do
    it 'should save the object and then move to the show page' do
      manual_farm_slug_test_object_create(test_name)
      page.should have_content(test_name)
      current_path.should == "/farm_slug_test_objects/#{test_name.parameterize}"
    end

    it 'should save with the proper slug' do
      manual_farm_slug_test_object_create(test_name)

      visit "/farm_slug_test_objects/#{test_name.parameterize}"
      page.status_code.should == 200
      page.should have_content(test_name)
    end

    it 'should list the new object on #index' do
      manual_farm_slug_test_object_create(test_name)
      visit '/farm_slug_test_objects'
      page.should have_content(test_name)
    end

    describe 'Validation Requests for new objects (unsaved)' do
      before(:each) do
        visit '/farm_slug_test_objects/new'
      end

      it 'should not save and return to #new, if the :id_method (:caption, here) is not present' do
        click_button 'Create'
        current_path.should == '/farm_slug_test_objects'
        page.should have_css('#new_farm_slug_test_object')
      end

      specify 'page should indicate why record was not saved' do
        #Relies on the FarmTools way of showing validations errors. Please Re-sepc if you use a different strategy.
        click_button 'Create'
        within('#error_explanation') do
          page.should have_content("Caption can't be blank")
        end
      end

      specify 'page should not have repeated warnings. This spec came up because of the tendency to validate the
               presence of the :id method on the Model, but that is already done on FarmSlugs' do
        click_button 'Create'
        # within('.field_with_errors has_errors') do
          page.should_not have_content("can't be blank;can't be blank")
        # end
      end
    end #validation Requests for new
  end

  describe 'Editing an Existing Record' do
    let!(:fsto){ create :farm_slug_test_object }
    # let(:path){  }

    describe 'Validation Errors while Editing' do
      it 'should return the user to the edit page if a validation error occurs' do
        path = "/farm_slug_test_objects/#{fsto.url_slug}"
        visit "#{path}/edit"
        fill_in 'Caption', with: ''
        click_button 'Update'

        current_path.should == path
        within('#error_explanation') do
          page.should have_content("Caption can't be blank")
        end
      end
    end
  end
end