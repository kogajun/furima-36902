FactoryBot.define do
  factory :order_address do
    postal_code      { '000-0000' }
    shipping_area_id { 2 }
    city             { '中市' }
    house_number     { '１番地' }
    building         { '中ビル201号室' }
    telephone_number { '0000000000' }
    token            { 'tok_abcdefghijk00000000000000000' }
  end
end
