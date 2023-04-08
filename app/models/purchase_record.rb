class PurchaseRecord < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_one :delivery_destination
end
