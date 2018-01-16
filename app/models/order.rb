class Order < ApplicationRecord
  belongs_to :owner, class_name: "User"
  belongs_to :borrower, class_name: "User"
  belongs_to :item
end
