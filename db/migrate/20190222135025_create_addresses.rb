class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :property_number
      t.string :street_name, null: false
      t.string :city, null: false
      t.string :area_code, null: false
      t.string :country, null: false
      t.references :contact, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
