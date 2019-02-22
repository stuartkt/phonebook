class Phonebook < ActiveRecord::Base
  include PgSearch

  validates :name, presence: true
  belongs_to :user

  pg_search_scope :search, against: :name, using: :tsearch
end
