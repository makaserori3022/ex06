# app/models/product.rb
class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, numericality: { only_integer: true, greater_than: 0 }
end
