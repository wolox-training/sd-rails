module Types
  module Models
    class RentType < Types::Base::BaseObject
      field :id, ID, null: false
      field :init_date, String, null: false
      field :return_date, String, null: false
    end
  end
end
