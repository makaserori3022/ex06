# app/models/cart.rb
class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  # cart_itemsを通じてproductにアクセスできるようにする例(任意)
  has_many :products, through: :cart_items
end
