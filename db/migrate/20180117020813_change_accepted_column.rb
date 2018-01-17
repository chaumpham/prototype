class ChangeAcceptedColumn < ActiveRecord::Migration[5.1]
  def change
    change_column :orders, :accepted, :string
  end
end
