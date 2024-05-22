# our monolith equivelant of this is file is Queries::BaseQuery
# it's children are usually in a queries/ directory.
#
# I'm using the word resolver here to be a bit more standard

module Resolvers
  class BaseResolver < GraphQL::Schema::Resolver
  end
end