class User < ApplicationRecord
  has_secure_password

  has_many :items
  has_many :orders

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
