FactoryGirl.define do
  sequence(:name){ |n| "Name_#{n}"}

  factory :gen do

  end

  factory :social_networking_profile do

  end

  factory :farm_slugs_object do
    name Faker::Name.name
  end

  factory :news_story do
    title Faker::Company.catch_phrase.titlecase

    factory :published do
      published true
    end

    factory :draft do
    end

    factory :archive do
      archived true
    end
  end

end