class V1::ItemsController < ApplicationController
  # before_action :authenticate_user

  def index
    if current_user
      items = current_user.items
      render json: items.as_json
    else 
      render json: {message: "Please log in to view your home page"}
    end
  end

  def create
    item = Item.new(
      name: params["name"],
      status: 1,
      color: params["color"],
      pattern: params["pattern"],
      size: params["size"],
      brand: params["brand"],
      image: params["image"],
      user_id: current_user.id
    )
    if item.save
      render json: item.as_json
    else
      render json: {errors: order.errors.full_messages}, status: :bad_request
    end
  end 
end
