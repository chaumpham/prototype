class V1::ItemsController < ApplicationController
  def index
    items = Item.all
    # items = current_user.items
    # if params[:user_id]
    #   items = User.find_by(id: params[:user_id]).items
    # end
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
    )
    item.save
    render json: item.as_json
  end 
end
