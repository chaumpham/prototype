class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :item_id
      t.integer :borrower_id
      t.integer :owner_id
      t.date :return_date
      t.boolean :accepted

      t.timestamps
    end
  end
end
