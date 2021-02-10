class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :shipping_status
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_days

  validates :title, :text, presence: true
  validates :category_id,        numericality: { other_than: 1 }
  validates :shipping_status_id, numericality: { other_than: 1 } 
  validates :shipping_cost_id,   numericality: { other_than: 1 }
  validates :prefecture_id,      numericality: { other_than: 1 }
  validates :shipping_days_id,   numericality: { other_than: 1 }
  
end
