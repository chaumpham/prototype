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

  def api
    require "google/cloud/vision"
    require "google/cloud/storage"
    # Imports the Google Cloud client library
    # Your Google Cloud Platform project ID
    project_id = "my-project-1505510657043"
    key_file = "/Users/chaupham/Downloads/Wardrobe-3311bcd8259a.json"
    storage = Google::Cloud::Storage.new project: project_id, keyfile: key_file
    # Instantiates a client
    vision = Google::Cloud::Vision.new project: project_id, keyfile: key_file
    # The name of the image file to annotate
    # file_name = "/Users/Allen/Downloads/cup.jpeg"
    image_path = "/Users/chaupham/Downloads/HM-Chunky-Knit-Sweater.jpg"
    # image_path = params[:image]
    image  = vision.image image_path
    web = image.web

    web_links = []
    index = 0
    web_length = web.pages_with_matching_images.length 
    web_length.times do
      web_links << web.pages_with_matching_images[index].grpc['url']
      index += 1 
    end

    render json: web_links[1..9]

  end

  def metainspector
    page = MetaInspector.new('http://www.hm.com/us/product/77823?article=77823-C')
    image = page.images.best
    render json: image.as_json
  end

  def show
    item_id = params[:id]
    item = Item.find_by(id: item_id)
    output = item.as_json
    render json: output
  end

  def show_with_matches
    require "google/cloud/vision"
    require "google/cloud/storage"

    item_id = params[:id]
    item = Item.find_by(id: item_id)
    # path = Rails.public_path.to_s + item.image.url.split("?")[0]

    project_id = "my-project-1505510657043"
    key_file = "/Users/chaupham/Downloads/Wardrobe-3311bcd8259a.json"
    storage = Google::Cloud::Storage.new project: project_id, keyfile: key_file
    vision = Google::Cloud::Vision.new project: project_id, keyfile: key_file
  
    image_path = Rails.public_path.to_s + item.image.url.split("?")[0]

    image  = vision.image image_path
    web = image.web

    web_links = []
    index = 0
    web_length = web.pages_with_matching_images.length 
    web_length.times do
      web_links << web.pages_with_matching_images[index].grpc['url']
      index += 1 
    end

    web_links = web_links[2..5]

    best_images = []
    index = 0
    3.times do 
      begin
        best_images << MetaInspector.new(web_links[index]).images.best
      rescue
        puts "~" * 50
        puts "could not find an image for index #{index}"
        puts "~" * 50
        best_images << MetaInspector.new(web_links[index]).images.first
      end
      index += 1 
    end

    best_images ? best_images : []

    output = item.as_json
    output["api_results"] = best_images

    render json: output

  end

  # def show
  #   item_id = params[:id]
  #   item = Item.find_by(id: item_id)

  #   #Convert image to base64 (decode)
  #   path = Rails.public_path.to_s + item.image.url.split("?")[0]
  #   data = File.read(path)
  #   base64_image = Base64.encode64(data)
    
  #   response = Unirest.post("https://api.threadgenius.co/v1/catalog/bloglovin_fashion/search",    
  #     headers: {
  #       "Content-Type" => "application/json"
  #     },
  #     auth: {
  #       :user=> "#{ENV['API_KEY']}"
  #     },
  #     parameters: {
  #       image: { 
  #         base64: base64_image
  #       },
  #       n_results: 9
  #     }.to_json)

  #   results = response.body["response"] ? response.body["response"]["results"] : []

  #   puts "*" * 50
  #   p response.body
  #   puts "*" * 50

  #   p results 

  #   array = []
  #   results.each do |result|
  #     array << result["object"]["image"]["url"]
  #   end

  #   output = item.as_json
  #   output["api_results"] = array

  #   render json: output
  # end
  def ss
    response = Unirest.post("http://api.shopstyle.com/api/v2/products?pid=#{ENV["SHOP_STYLE_API_KEY"]}&fts=red+dress&offset=0&limit=10")
    results = response.body

    render json: results.as_json

  end
end
