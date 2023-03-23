class RegionalOriginalDelivery < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :regional_original_delivery_list

  validates :title, :text, presence: true
  
  validates :regional_original_delivery_id, numericality: { other_than: 1 , message: "can't be blank"}
end
