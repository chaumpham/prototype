class V1::ItemsController < ApplicationController
  # before_action :authenticate_user

  def index
    items = current_user.items
    render json: items.as_json
  end

  def create
    item = Item.new(
      name: params["name"],
      status: 1,
      color: params["color"],
      pattern: params["pattern"],
      size: params["size"],
      brand: params["brand"],
      user_id: current_user.id
    )
    item.save
    render json: item.as_json
  end 
end
