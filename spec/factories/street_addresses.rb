FactoryBot.define do
  factory :street_address do
    postal_code { "222-2222" }
    area { '東京' }
    city { "岐阜市" }
    block_number { "夕香の塔" }
    house_number { "500-11" }
    phone_number { "11111111111" }
    seller_id { 1 }
  end
end
