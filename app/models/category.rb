class Category < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  validates :title, :text, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
end
