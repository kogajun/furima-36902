FactoryBot.define do
  factory :item do
    item_name          {'ポスター'}
    explanation        {'オムライスのポスター'}
    category_id        {'2'}
    condition_id       {'2'}
    shipping_charge_id {'2'}
    shipping_area_id   {'2'}
    shipping_day_id    {'2'}
    price              {'1500'}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
