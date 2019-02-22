module Api
  module V1
    class SinglePhonebookSerializer < ActiveModel::Serializer
      attributes :id, :name, :contacts
    end
  end
end
