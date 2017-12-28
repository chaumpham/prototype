class V1::ItemsController < ApplicationController
  def index
    items = Item.all
    render json: items.as_json
  end
end
