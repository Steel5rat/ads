Ads::Application.routes.draw do

  get "ads/new_ads"

  get "ads/archive_ads"

  get "ads/approved_ads"

  get "admin_actions/deny"

  get "admin_actions/approve"

  get "user_actions/to_draft"

  get "user_actions/to_new"

  get "ads/myads"

  devise_for :users

  resources :users


  resources :ads_types


  resources :images


  resources :ads


  root :to => 'ads#index'
end
