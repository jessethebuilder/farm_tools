FactoryGirl.define do
  factory :farm_tools_mountable_image, :class => 'FarmTools::MountableImage' do
    image "MyString"
label "MyString"
description "MyText"
has_mountable_images_id 1
has_mountable_images_type "MyString"
  end

end
