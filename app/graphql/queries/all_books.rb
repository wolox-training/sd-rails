module Queries
  module AllBooks
    extend ActiveSupport::Concern
    included do
      def all_books
        Book.all
      end

      def self.all_books_type
        [Types::Models::BookType]
      end
    end
  end
end
