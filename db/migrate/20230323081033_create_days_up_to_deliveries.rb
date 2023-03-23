class CreateDaysUpToDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :days_up_to_deliveries do |t|
      t.string     :title        , null: false
      t.text       :text         , null: false
      t.integer    :days_up_to_delivery_id    , null: false
      t.timestamps
    end
  end
end
