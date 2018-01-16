class V1::OrdersController < ApplicationController
  
  def index 
    order = Order.all
    render json: order.as_json
  end

  def create
    # item = Item.find_by(id: params[:item_id])
    order = Order.new(
      borrower_id: current_user.id,
      item_id: params[:item_id],
      owner_id: params[:owner_id],
      return_date: params[:return_date] || Time.now,
      accepted: false
       )
    if order.save
      render json: order.as_json
    else 
      render json: {errors: order.errors.full_messages}, status: :bad_request
    end
  end
end
