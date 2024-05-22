module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # ========================================================================
    # begin several author field examples
    # ========================================================================
    # the most basic approach, define a field and a resolver function that can
    # return something that matches the defined types
    #
    # field(:author, Types::AuthorType, null: true)

    # def author
    #   return Author.first
    # end

    # ________________________________________________________________________

    # The same as the basic approach. Only this time, with a block that defines
    # a list of arguments the graphql schema should be exposed.
    #
    # Because the argument is defined, the resolver function needs to defined
    # a corresponding way to handle that argument if it's passed
    #
    # field(:author, Types::AuthorType, null: true) do
    #   argument(:id, ID, required: false)
    # end

    # def author(id:)
    #   return Author.find_by(id: id)
    # end

    # ________________________________________________________________________

    # resolver classes can take everything from above a step further but
    # encapsulate everything into a dedicated class.
    # We do this for 1 of 2 main reasons in the monolith:
    # 1. at the root level to define our various "entry points"
    # 2. in other nested type definition when a paginated list is returned
    #
    field(:author, resolver: Resolvers::AuthorResolver)

    # ========================================================================
    # end several author field examples
    # ========================================================================
  end
end
