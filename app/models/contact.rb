class Contact < ActiveRecord::Base
  include PgSearch
  belongs_to :phonebook
  has_one :address, dependent: :destroy
  has_many :phone_numbers, dependent: :destroy
  has_many :emails, dependent: :destroy

  pg_search_scope :search, against: :name, using: :tsearch

  accepts_nested_attributes_for :phone_numbers, allow_destroy: true
  accepts_nested_attributes_for :address, allow_destroy: true
  accepts_nested_attributes_for :emails, allow_destroy: true
end
