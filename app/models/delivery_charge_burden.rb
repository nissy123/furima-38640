class DeliveryChargeBurden < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :delivery_charge_burden_list

  validates :title, :text, presence: true

  validates :delivery_charge_burden_id, numericality: { other_than: 1 , message: "can't be blank"}

end
