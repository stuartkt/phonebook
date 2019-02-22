class Email < ActiveRecord::Base
  belongs_to :contact

  enum email_type: { home: 0, work: 1 }
  validates_format_of :address, with: Devise.email_regexp
end
