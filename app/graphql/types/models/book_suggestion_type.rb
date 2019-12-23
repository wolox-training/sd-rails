module Types
  module Models
    class BookSuggestionType < Types::Base::BaseObject
      field :id, ID, null: false
      field :author, String, null: false
      field :price, String, null: false
    end
  end
end
