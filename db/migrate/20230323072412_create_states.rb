class CreateStates < ActiveRecord::Migration[6.0]
  def change
    create_table :states do |t|
      t.string     :title        , null: false
      t.text       :text         , null: false
      t.integer    :state_id     , null: false
      t.timestamps
    end
  end
end
