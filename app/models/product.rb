class Product < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  
  belongs_to :genre, optional: true
  belongs_to :days_up_to_delivery_list, optional: true
  belongs_to :delivery_charge_burden_list, optional: true
  belongs_to :regional_original_delivery_list, optional: true
  belongs_to :statelist, optional: true
 
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
