class Phonebook < ActiveRecord::Base
  include PgSearch

  validates :name, presence: true
  belongs_to :user
  has_many :contacts, dependent: :destroy

  accepts_nested_attributes_for :contacts, allow_destroy: true
  pg_search_scope :search, against: :name, using: :tsearch
end
