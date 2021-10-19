class Item < ApplicationRecord
  validates :image,                 presence: true
  validates :item_name,             presence: true, length: { maximum: 40 }
  validates :explanation,           presence: true, length: { maximum: 100 }
  validates :category_id,           presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id,          presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_charge_id,    presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_area_id,      presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_day_id,       presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :price,                 presence: true, numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000 }

  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_day
  has_one :order
end
