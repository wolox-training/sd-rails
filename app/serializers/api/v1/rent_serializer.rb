module Api
  module V1
    class RentSerializer < ActiveModel::Serializer
      attributes :id, :init_date, :return_date, :book, :user
    end
  end
end
