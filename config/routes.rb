Rails.application.routes.draw do
  post "user_token" => "user_token#create"
  namespace :v1 do
    get "/users" => "users#index"
    get "/users/:id" => "users#show"
    post "/users" => "users#create"

    get "/items" => "items#index"
    post "/items" => "items#create"
    get "/items/:id" => "items#show"
    get "/items/:id/matches" => "items#show_with_matches"
    patch "/items/:id" => "items#update"
    get "/api" => "items#api"
    get "/shopstyle" => "items#ss"
    get "/metainspector" => "items#metainspector"
    get "/threadgenius" => "items#threadgenius"

    get "/orders" => "orders#index"
    post "/orders" => "orders#create"
    get "/sent" => "orders#sent"
    get "/received" => "orders#received"
    patch "/orders/:id" => "orders#update"
  end
end
