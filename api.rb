# Imports the Google Cloud client library
require "google/cloud/vision"

# Your Google Cloud Platform project ID
project_id = "my-project-1505510657043"

# Instantiates a client
vision = Google::Cloud::Vision.new project: project_id

# The name of the image file to annotate
file_name = "/Users/chaupham/Downloads/item-2.jpg"
image_path = "/Users/chaupham/Downloads/item-2.jpg"

# Performs label detection on the image file
labels = vision.image(file_name).labels
image  = vision.image image_path

puts "Labels:"
labels.each do |label|
  puts label.description
end

web = image.web

web.entities.each do |entity|
  puts entity.description
end

web.full_matching_images.each do |image|
  puts image.url
end