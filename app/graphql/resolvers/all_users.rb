module Resolvers
  class AllUsers < GraphQL::Schema::Resolver
    type [Types::Models::UserType], null: true

    argument :limit, Int, required: false

    def resolve(limit: 20)
      User.limit(limit)
    end
  end
end
