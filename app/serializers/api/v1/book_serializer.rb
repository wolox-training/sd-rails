module Api
  module V1
    class BookSerializer < ActiveModel::Serializer
      attributes :id, :author, :title, :genre, :editor, :year, :image
      has_many :rents
    end
  end
end
