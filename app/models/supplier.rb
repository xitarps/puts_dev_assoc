class Supplier < ApplicationRecord
  has_many :product_suppliers
  has_many :products, through: :product_suppliers

  has_one :location
end

# Supplier.joins(product_suppliers: :product)
#         .select("COUNT(suppliers.id) AS total_suppliers", products: [ :name ])
#         .group(products: :name)
#         .order(total_suppliers: :desc)

# prod = Product.first.suppliers.first.location.country

# SELECT "products".* FROM "products" ORDER BY "products"."id" ASC LIMIT 1

# SELECT "suppliers".* FROM "suppliers"
# INNER JOIN "product_suppliers" ON "suppliers"."id" = "product_suppliers"."supplier_id"
# WHERE "product_suppliers"."product_id" = 1 ORDER BY "suppliers"."id" ASC LIMIT 1

# SELECT "locations".* FROM "locations" WHERE "locations"."supplier_id" = 1 LIMIT 1


# prod = Product.select(:name, locations: :country)
#               .joins(product_suppliers: { supplier: :location })
#               .where(products: { id: 1 })
#               .first


# Supplier.find(1).location.count


# SELECT "suppliers".* FROM "suppliers" ORDER BY "suppliers"."id" ASC LIMIT 1
# SELECT "locations".* FROM "locations" WHERE "locations"."supplier_id" = 1 LIMIT 1



# sup = Supplier.select(['*'], location: ['*'])
#               .joins(:location)
#               .where(id: 1)
#               .first
#               .name

# sup = Supplier.select(['*'], locations: ['*'])
#               .joins('INNER JOIN locations ON locations.supplier_id = suppliers.id')
#               .where(id: 1)
#               .first
#               .name
  
# sup = Supplier.select(['*'], batata: ['*'])
#               .joins('INNER JOIN locations batata ON batata.supplier_id = suppliers.id')
#               .where(id: 1)
#               .first
#               .name

# sup = Supplier.select('suppliers.id', 'suppliers.name',
#                       "CONCAT(suppliers.name, ' - ', batata.country) AS full_name",
#                       batata: ['*'])
#               .joins('INNER JOIN locations batata ON batata.supplier_id = suppliers.id')
#               .where(id: 1)
#               .first
#               .full_name
 
# SELECT "suppliers"."id", "suppliers"."name", "location".id AS location_id, "location"."country"
# FROM "suppliers"
# INNER JOIN "locations" "location" ON "location"."supplier_id" = "suppliers"."id"
# WHERE "suppliers"."id" = 1 ORDER BY "suppliers"."id" ASC LIMIT 1