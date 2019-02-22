module Api
  module V1
    class PhonebookSerializer < ActiveModel::Serializer
      attributes :id, :name
    end
  end
end
