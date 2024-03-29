class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :product_name, null: false
      t.text :description, null: false
      t.integer :category_id, null: false
      t.integer :state_id, null: false
      t.integer :delivery_charge_burden_id, null: false
      t.integer :regional_original_delivery_id, null: false
      t.integer :days_up_to_delivery_id, null: false
      t.integer :price, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
