module Api
  module V1
    class ContactSerializer < ActiveModel::Serializer
      attributes :id, :name, :phone_numbers, :emails, :address
    end
  end
end
