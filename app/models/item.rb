class Item < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :description
    validates :shipping_cost_id
    validates :shipping_days_id
    validates :prefecture_id
    validates :category_id
    validates :shipping_status_id
    validates :image
  end

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_days
  belongs_to_active_hash :shipping_status
  belongs_to_active_hash :shipping_cost
end
