class CreatePhoneNumbers < ActiveRecord::Migration
  def change
    create_table :phone_numbers do |t|
      t.string :phone_number, null: false
      t.integer :type, null: false
      t.references :contact, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
