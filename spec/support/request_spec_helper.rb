module RequestSpecHelper
  def manual_farm_slug_test_object_create(caption)
    visit 'farm_slug_test_objects/new'
    fill_in 'Caption', :with => caption
    click_button 'Create'
    FarmSlugTestObject.last
  end

  def manual_login_as(user, password: 'testtest')
    #user param accepts either an existing user or a UserLevel.
    if user.class == User
      u = user
    else
      u = FactoryGirl.create user.to_s, :password => password
    end

    visit '/d/users/sign_in'
    fill_in 'Email', :with => u.email
    fill_in 'Password', :with => password
    click_button 'Log in'
    u
  end
  #
  # def setup_store
  #   gym = create :gym
  # end

end