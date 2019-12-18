module Types
  class QueryType < Types::Base::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end
    
    # AVAILABLE_QUERIES = %w[all_books].freeze

    # include Queries::AllBooks

    # AVAILABLE_QUERIES.each do |method|
    #   field method.to_sym, public_send("#{method}_type".to_sym), null: true
    # end
  end
end
