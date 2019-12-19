module Resolvers
  class AllBooks < GraphQL::Schema::Resolver
    type [Types::Models::BookType], null: true

    def resolve
      Book.all
    end
  end
end
