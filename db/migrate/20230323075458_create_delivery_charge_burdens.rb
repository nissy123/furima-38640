class CreateDeliveryChargeBurdens < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_charge_burdens do |t|
      t.string     :title        , null: false
      t.text       :text         , null: false
      t.integer    :delivery_charge_burden_id     , null: false
      t.timestamps
    end
  end
end
