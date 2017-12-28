Rails.application.routes.draw do
  post "user_token" => "user_token#create"
  namespace :v1 do
    post "/users" => "users#create"

    get "/items" => "items#index"
    post "/items" => "items#create"
  end
end
