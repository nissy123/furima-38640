class DaysUpToDelivery < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :days_up_to_delivery_list

  validates :title, :text, presence: true

  validates :days_up_to_delivery_id, numericality: { other_than: 1 , message: "can't be blank"}
end
