ThriveMarket::Application.routes.draw do

  root 'static_pages#home'

  get "/home" => "static_pages#home", as: :home
  get "/thanks" => "static_pages#thanks", as: :thanks

end
