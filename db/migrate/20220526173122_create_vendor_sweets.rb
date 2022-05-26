class CreateVendorSweets < ActiveRecord::Migration[6.1]
  def change
    create_table :vendor_sweets do |t|
      t.belongs_to :vendor, null: false, foreign_key: true
      t.belongs_to :sweet, null: false, foreign_key: true
      t.integer :price

      t.timestamps
    end
  end
end
