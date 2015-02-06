FactoryGirl.define do
  sequence(:name){ |n| "Name_#{n}"}

  factory :gen do

  end

  factory :farm_slugs_object do
    name Faker::Name.name
  end
end