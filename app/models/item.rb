class Item < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :price, numericality: { only_integer: true, message: "Half-width number." }
    validates :description
    validates :image
    
  end

  with_options numericality: { other_than: 1} do
    validates :shipping_cost_id
    validates :shipping_days_id
    validates :prefecture_id
    validates :category_id
    validates :shipping_status_id
  end

  belongs_to :user
  has_one_attached :image
  has_one    :buyer

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_days
  belongs_to_active_hash :shipping_status
  belongs_to_active_hash :shipping_cost
end
