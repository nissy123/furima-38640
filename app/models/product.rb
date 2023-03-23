class Product < ApplicationRecord
  has_one_attached :image
  belongs_to :user


  validates :product_name, presence: true , length: {maximum: 40}
  validates :description, presence: true  ,length: {maximum: 1000}
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },format: { with: /\A[0-9]+\z/ }

  validates :image, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end

end
