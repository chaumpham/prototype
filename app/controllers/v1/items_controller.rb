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

  def api
    require "google/cloud/vision"

    # Your Google Cloud Platform project ID
    project_id = "my-project-1505510657043"
    key_file   = "/Users/chaupham/Actualize/prototype/Wardrobe-cfbf75f97de9.json"

    # Instantiates a client
    vision = Google::Cloud::Vision.new project: project_id, keyfile: key_file

    image_path = "/Users/chaupham/Downloads/item-4.jpg"
    image  = vision.image image_path

    web = image.web

    array = []
    # render json: web.entities.as_json
    web.entities.each do |entity|
      array << entity.description
    end
    render json: { array: array }
  end

end
