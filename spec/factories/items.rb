FactoryBot.define do
  factory :item do
    
    price                 {2000}
    name                  {'名前'}
    description           {'説明'}
    category_id           {2}
    shipping_status_id    {2}
    shipping_cost_id      {2}
    prefecture_id         {2}
    shipping_days_id      {2}

    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
