module Api
  module V1
    class BookSerializer < ActiveModel::Serializer
      attributes :id, :author, :title, :genre, :editor, :year, :image, :rents

      def rents
        object.rents.map do |rent|
          {
            id: rent.id,
            init_date: rent.init_date,
            return_date: rent.return_date,
            book_id: rent.book_id,
            user_id: rent.user_id
          }
        end
      end
    end
  end
end
