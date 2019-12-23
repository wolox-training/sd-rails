module Types
  class QueryType < Types::Base::BaseObject
    field :all_books, resolver: Resolvers::AllBooks
    field :search_books, resolver: Resolvers::SearchBooks

    field :all_users, resolver: Resolvers::AllUsers
  end
end
