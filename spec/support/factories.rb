FactoryGirl.define do
  sequence(:name){ |n| "Name_#{n}"}

  factory :gen do

  end

  factory :social_networking_profile do

  end

  factory :farm_slugs_object do
    name Faker::Name.name
  end
end