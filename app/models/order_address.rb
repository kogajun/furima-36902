class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :shipping_area_id, :city, :house_number, :building, :telephone_number, :token

  with_options presence: true do
    validates :user_id, :item_id, :city, :house_number, :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :shipping_area_id, numericality: { other_than: 1 }
    validates :telephone_number, format: { with: /\A\d{10,11}\z/ }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(order: order, postal_code: postal_code, shipping_area_id: shipping_area_id, city: city,
                   house_number: house_number, building: building, telephone_number: telephone_number)
  end
end
