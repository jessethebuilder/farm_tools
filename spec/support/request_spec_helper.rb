module RequestSpecHelper

  def manual_farm_slug_test_object_create(caption)
    visit 'farm_slug_test_objects/new'
    fill_in 'Caption', :with => caption
    click_button 'Create'
    FarmSlugTestObject.last
  end

end