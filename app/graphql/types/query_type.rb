module Types
  class QueryType < Types::Base::BaseObject
    AVAILABLE_QUERIES = %w[all_books].freeze

    include Queries::AllBooks

    AVAILABLE_QUERIES.each do |method|
      field method.to_sym, public_send("#{method}_type".to_sym), null: true
    end
  end
end
