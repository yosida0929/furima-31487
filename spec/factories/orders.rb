FactoryBot.define do
  factory :order do
      post_code { "222-2222" }
      city { "岐阜市" }
      address { "番の地" }
      phone_number { "09010101010" }
      prefecture_id {2}
      token {"123asd"}
  end
end
