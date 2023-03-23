class State < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :statelist

  validates :title, :text, presence: true

  validates :state_id, numericality: { other_than: 1 } 

  validates :state_id, numericality: { other_than: 1 , message: "can't be blank"}
end
