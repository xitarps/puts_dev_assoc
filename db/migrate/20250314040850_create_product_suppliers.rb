class CreateProductSuppliers < ActiveRecord::Migration[8.0]
  def change
    create_table :product_suppliers do |t|
      t.references :product, null: false, foreign_key: true
      t.references :supplier, null: false, foreign_key: true

      t.timestamps
    end
  end
end
