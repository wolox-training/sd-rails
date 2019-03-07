module Api
  module V1
    class RentSerializer < ActiveModel::Serializer
      attributes :id, :init_date, :return_date, :book_id, :user_id
    end
  end
end
