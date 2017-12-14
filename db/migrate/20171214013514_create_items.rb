class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :status
      t.string :color
      t.string :type
      t.string :pattern
      t.string :size
      t.string :brand
      t.integer :user_id

      t.timestamps
    end
  end
end
