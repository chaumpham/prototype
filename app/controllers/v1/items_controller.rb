class V1::ItemsController < ApplicationController
  # before_action :authenticate_user

  def index
    if current_user
      items = current_user.items
      render json: items.as_json
    else 
      render json: {message: "Please login to view your items"}
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

  def show
    item_id = params[:id]
    item = Item.find_by(id: item_id)

    #Convert image to base64 (decode)
    path = Rails.public_path.to_s + item.image.url.split("?")[0]
    data = File.read(path)
    base64_image = Base64.encode64(data)
    
    response = Unirest.post("https://api.threadgenius.co/v1/catalog/bloglovin_fashion/search",    
      headers: {
        "Content-Type" => "application/json"
      },
      auth: {
        :user=> "#{ENV['API_KEY']}"
      },
      parameters: {
        image: { 
          base64: base64_image
        },
        n_results: 5
      }.to_json)

    results = response.body["response"]["results"]
    array = []
    results.each do |result|
      array << result["object"]["image"]["url"]
    end

    output = item.as_json
    output["api_results"] = array

    render json: output
  end

  def update
    item_id = params[:id]
    item = Item.find_by(id: item_id)
    item.name = params[:name] || item.name
    item.color = params[:color] || item.color
    item.pattern = params[:pattern] || item.pattern
    item.size = params[:size] || item.size
    item.brand = params[:brand] || item.brand
    item.image = params[:image] || item.image
    item.save
    render json: item.as_json
  end

  def threadgenius
    apikey = "fakekeyhahaha"
    response = Unirest.post("https://api.threadgenius.co/v1/catalog/bloglovin_fashion/search",    
      headers: {
        "Content-Type" => "application/json"
      },
      auth: {
        :user=>apikey
      },
      parameters: {
        image: { 
          url: "https://dtpmhvbsmffsz.cloudfront.net/posts/2016/10/01/57f0648f4127d005950191a5/m_57f0648f4127d005950191a6.jpg",
        },
        n_results: 5
      }.to_json)

    results = response.body["response"]["results"]
    array = []
    results.each do |result|
      array << result["object"]["image"]["url"]
    end
    render json: array.as_json
  end

end
