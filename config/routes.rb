Rails.application.routes.draw do
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  resources :news_stories

  resources :businesses

  resources :test_models

end
