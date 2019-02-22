class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :address, null: false
      t.integer :type, null: false
      t.references :contact, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
