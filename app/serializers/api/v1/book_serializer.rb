module Api
  module V1
    class BookSerializer < ActiveModel::Serializer
      attributes :id, :author, :title, :image, :editor, :year, :genre, :created_at, :updated_at
      has_many :rents
    end
  end
end
