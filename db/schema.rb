# encoding: UTF-8

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_190_222_150_221) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'addresses', force: :cascade do |t|
    t.string   'property_number'
    t.string   'street_name',     null: false
    t.string   'city',            null: false
    t.string   'area_code',       null: false
    t.string   'country',         null: false
    t.integer  'contact_id'
    t.datetime 'created_at',      null: false
    t.datetime 'updated_at',      null: false
  end

  add_index 'addresses', ['contact_id'], name: 'index_addresses_on_contact_id', using: :btree

  create_table 'contacts', force: :cascade do |t|
    t.string   'name', null: false
    t.integer  'phonebook_id'
    t.datetime 'created_at',   null: false
    t.datetime 'updated_at',   null: false
  end

  add_index 'contacts', ['phonebook_id'], name: 'index_contacts_on_phonebook_id', using: :btree

  create_table 'emails', force: :cascade do |t|
    t.string   'address',    null: false
    t.integer  'email_type', null: false
    t.integer  'contact_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_index 'emails', ['contact_id'], name: 'index_emails_on_contact_id', using: :btree

  create_table 'phone_numbers', force: :cascade do |t|
    t.string   'phone_number', null: false
    t.integer  'phone_type',   null: false
    t.integer  'contact_id'
    t.datetime 'created_at',   null: false
    t.datetime 'updated_at',   null: false
  end

  add_index 'phone_numbers', ['contact_id'], name: 'index_phone_numbers_on_contact_id', using: :btree

  create_table 'phonebooks', force: :cascade do |t|
    t.string   'name',       null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer  'user_id'
  end

  add_index 'phonebooks', ['user_id'], name: 'index_phonebooks_on_user_id', using: :btree

  create_table 'users', force: :cascade do |t|
    t.string   'provider',               default: 'email', null: false
    t.string   'uid',                    default: '',      null: false
    t.string   'encrypted_password',     default: '',      null: false
    t.string   'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer  'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.string   'current_sign_in_ip'
    t.string   'last_sign_in_ip'
    t.string   'confirmation_token'
    t.datetime 'confirmed_at'
    t.datetime 'confirmation_sent_at'
    t.string   'unconfirmed_email'
    t.string   'name'
    t.string   'nickname'
    t.string   'image'
    t.string   'email'
    t.json     'tokens'
    t.datetime 'created_at'
    t.datetime 'updated_at'
  end

  add_index 'users', ['confirmation_token'], name: 'index_users_on_confirmation_token', unique: true, using: :btree
  add_index 'users', ['email'], name: 'index_users_on_email', unique: true, using: :btree
  add_index 'users', ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true, using: :btree
  add_index 'users', %w[uid provider], name: 'index_users_on_uid_and_provider', unique: true, using: :btree

  add_foreign_key 'addresses', 'contacts'
  add_foreign_key 'contacts', 'phonebooks'
  add_foreign_key 'emails', 'contacts'
  add_foreign_key 'phone_numbers', 'contacts'
  add_foreign_key 'phonebooks', 'users'
end
