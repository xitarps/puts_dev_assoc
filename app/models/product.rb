class Product < ApplicationRecord
  has_many :product_suppliers
  has_many :suppliers, through: :product_suppliers
end
