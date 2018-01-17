class Order < ApplicationRecord
  belongs_to :owner, class_name: "User"
  belongs_to :borrower, class_name: "User"
  belongs_to :item

  def as_json
    {
      id: id,
      item_id: item_id,
      borrower_id: borrower_id,
      owner_id: owner_id,
      owner: owner.as_json,
      borrower: borrower.as_json,
      return_date: return_date,
      accepted: accepted,
      item: item.as_json,
    }
  end
end
