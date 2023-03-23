class CreateRegionalOriginalDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :regional_original_deliveries do |t|
      t.string     :title        , null: false
      t.text       :text         , null: false
      t.integer    :egional_original_delivery_id     , null: false
      t.timestamps
    end
  end
end
