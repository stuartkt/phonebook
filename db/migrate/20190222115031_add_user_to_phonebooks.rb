class AddUserToPhonebooks < ActiveRecord::Migration
  def change
    add_reference :phonebooks, :user, index: true, foreign_key: true
  end
end
