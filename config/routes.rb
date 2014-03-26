ThriveMarket::Application.routes.draw do

  root 'static_pages#home'

  get  "/home" => "static_pages#home", as: :home
  get  "/thanks" => "static_pages#thanks", as: :thanks
  post "/phone_numbers" => "phone_numbers#create"
  post  "webhooks/sms" => 'webhooks#incoming_text'
  post "survey_items/create" => 'survey_items#create', as: :survey_items

end
