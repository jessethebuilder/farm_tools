Rails.application.routes.draw do
  resources :farm_notes

  #include this route in any app using NewsStories
  # mount Bootsy::Engine => '/bootsy', as: 'bootsy'

  resources :news_stories

  resources :businesses
end
