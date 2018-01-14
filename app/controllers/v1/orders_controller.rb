class V1::OrdersController < ApplicationController
  def create
    item = Item.find_by(id: params[:item_id])
    order = Order.new(
      borrower_id: current_user.id,
      item_id: params[:item_id],
      owner_id: params[:user_id],
      return_date: params[:return_date],
      accepted: false
       )
    if order.save
      render json: order.as_json
    else 
      render json: {errors: order.errors.full_messages}, status: :bad_request
    end
  end
end
