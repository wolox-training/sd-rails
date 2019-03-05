module Api
  module V1
    class BooksListSerializer < ActiveModel::Serializer
      attributes :id, :author, :title, :image, :editor, :year, :genre, :created_at, :updated_at
    end
  end
end
