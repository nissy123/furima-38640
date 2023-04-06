class PurchaseRecordForm
  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :postal_code, :prefecture_id, :city, :block, :buildings_name, :phone_number, :purchase_record_id, :token

  with_options presence: true do

    validates :user_id
    validates :product_id
    
    validates :city
    validates :phone_number, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :token
  end

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, product_id: product_id)
    purchase_recoad = DeliveryDestination.create(purchase_record_id: purchase_record.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, block: block, buildings_name: buildings_name, phone_number: phone_number)
  end
  
end