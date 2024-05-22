module Resolvers
  class AuthorResolver < Resolvers::BaseResolver
    type(Types::AuthorType, null: true)

    argument(:id, ID, required: false)

    def resolve(id:)
      # POP QUIZ: what's missing here that we _always_ want in the real world?
      # 2 right answers...

      return Author.find_by(id: id)
    end
  end
end