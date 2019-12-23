module Types
  module Models
    class UserType < Types::Base::BaseObject
      field :id, ID, null: false
      field :email, String, null: false
      field :first_name, String, null: false
      field :rents, [Types::Models::RentType], null: true
    end
  end
end
