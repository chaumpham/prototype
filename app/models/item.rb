class Item < ApplicationRecord
  belongs_to :user
  has_many :orders

  has_attached_file :image
    
  validates_attachment :image,
    content_type: {
      content_type: ["image/jpeg", "image/gif", "image/png"]
    }
end