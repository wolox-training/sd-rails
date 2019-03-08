module Api
  module V1
    class SimpleRentSerializer < ActiveModel::Serializer
      attributes :id, :init_date, :return_date, :user
    end
  end
end
