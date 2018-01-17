class V1::OrdersController < ApplicationController
  
  def index 
    order = Order.all
    render json: order.as_json
  end

  def sent
    if current_user
      orders = current_user.sent_orders
      render json: orders.as_json
    else
      render json: {message: "Please login to view your sent requests"}
    end
  end

  def received
    if current_user
      orders = current_user.received_orders
      render json: orders.as_json
    else
      render json: {message: "Please login to view your received requests"}
    end
  end

  def create
    order = Order.new(
      borrower_id: current_user.id,
      item_id: params[:item_id],
      owner_id: params[:owner_id],
      return_date: params[:return_date] || Time.now,
      accepted: "pending"
       )
    if order.save
      render json: order.as_json
    else 
      render json: {errors: order.errors.full_messages}, status: :bad_request
    end
  end

  def update
    order_id = params["id"]
    order = Order.find_by(id: order_id)
    order.accepted = "accepted"
    order.save
    render json: order.as_json
  end

end
