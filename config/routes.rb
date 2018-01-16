Rails.application.routes.draw do
  post "user_token" => "user_token#create"
  namespace :v1 do
    get "/users" => "users#index"
    get "/users/:id" => "users#show"
    post "/users" => "users#create"

    get "/items" => "items#index"
    post "/items" => "items#create"

    get "/orders" => "orders#index"
    post "/orders" => "orders#create"
  end
end
