class Order 
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :address
    validates :phone_number, numericality: { only_integer: true, message: "Input only number"}
    validates :token
    validates :user_id
    validates :item_id
    validates :phone_number, format: {with: /\A\d{10,11}\z/}
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "Select" }

  def save
    @buyer = Buyer.create(user_id: user_id, item_id: item_id)
    StreetAddress.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, buyer_id: @buyer.id)
  end
end
