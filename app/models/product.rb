class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchase_record
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :days_up_to_delivery
  belongs_to :delivery_charge_burden
  belongs_to :regional_original_delivery
  belongs_to :state
 
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :days_up_to_delivery_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_charge_burden_id, numericality: { other_than: 1 , message: "can't be blank"}  
  validates :regional_original_delivery_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :state_id, numericality: { other_than: 1 , message: "can't be blank"}

  validates :product_name, presence: true , length: {maximum: 40}
  validates :description, presence: true  ,length: {maximum: 1000}
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true }
  

  validates :image, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end

end
