module Types
  class QueryType < Types::Base::BaseObject
    field :all_books, resolver: Resolvers::AllBooks
  end
end
