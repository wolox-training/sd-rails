module Resolvers
  class AllBooks < GraphQL::Schema::Resolver
    type [Types::Models::BookType], null: true

    argument :limit, Int, required: false

    def resolve(limit: 20)
      Book.limit(limit)
    end
  end
end
