module Types
  module Models
    class BookType < Types::Base::BaseObject
      field :genre, String, null: false
      field :author, String, null: false
      field :image, String, null: false
      field :title, String, null: false
      field :editor, String, null: false
      field :year, String, null: false
    end
  end
end
