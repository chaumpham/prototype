class User < ApplicationRecord
  has_secure_password

  has_many :items
  has_many :sent_orders, class_name: "Order", foreign_key: :borrower_id
  has_many :received_orders, class_name: "Order", foreign_key: :owner_id

  def as_json
    {
      id: id,
      email: email,
      first_name: first_name,
      last_name: last_name,
      items: items.as_json,
    }
  end
end
