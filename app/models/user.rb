class User < ActiveRecord::Base
  # Include default devise modules.
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable,
         :trackable, :validatable, :registerable

  include DeviseTokenAuth::Concerns::User

  has_many :phonebooks, dependent: :destroy

  validates_format_of :email, with: Devise.email_regexp
end
