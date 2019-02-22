class PhoneNumber < ActiveRecord::Base
  belongs_to :contact

  enum phone_type: { home: 0, mobile: 1, work: 2 }
end
