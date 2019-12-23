module Resolvers
  class SearchBooks < GraphQL::Schema::Resolver
    type [Types::Models::BookType], null: true

    argument :title, String, required: false
    argument :genre, String, required: false
    argument :limit, Int, required: false

    def resolve(title:, genre:, limit: 10)
      Book.where(title: title, genre: genre).limit(limit)
    end
  end
end
