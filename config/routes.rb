Rails.application.routes.draw do
  post "user_token" => "user_token#create"
  namespace :v1 do
    get "/users" => "users#index"
    get "/users/:id" => "users#show"
    post "/users" => "users#create"

    get "/items" => "items#index"
    post "/items" => "items#create"
    get "/items/:id" => "items#show"
    patch "/items/:id" => "items#update"
    get "/api" => "items#api"
    get "/threadgenius" => "items#threadgenius"

    get "/orders" => "orders#index"
    post "/orders" => "orders#create"
    get "/sent" => "orders#sent"
    get "/received" => "orders#received"
    patch "/orders/:id" => "orders#update"
  end
end
