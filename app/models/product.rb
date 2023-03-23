class Product < ApplicationRecord
  has_one_attached :image

  validates :product, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
end
