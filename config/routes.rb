ThriveMarket::Application.routes.draw do

  root 'static_pages#home'

  get  "/home"               => "static_pages#home",     as: :home
  get  "/thanks"             => "static_pages#thanks",   as: :thanks
  post "/phone_numbers"      => "phone_numbers#create"
  post  "webhooks/sms"       => 'webhooks#incoming_text'
  post "survey_items/create" => 'survey_items#create',   as: :survey_items

  get    "admin/signin"  => "sessions#new",     as: :sign_in
  delete "admin/signout" => 'sessions#destroy', as: :sign_out

  resources :sessions, only: [ :create ]
  resources :updates,  only: [ :create, :destroy ]

  get "admin"         => "admin#index",         as: :admin
  get "admin/survey_items"  => "admin#survey_items",  as: :admin_survey_items
  get "admin/phone_numbers" => "admin#phone_numbers", as: :admin_phone_numbers
  get "admin/updates"       => "admin#updates",       as: :admin_updates

end
