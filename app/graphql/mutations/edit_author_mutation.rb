module Mutations
  class EditAuthorMutation < Mutations::BaseMutation
    field(:author, Types::AuthorType, null: false)

    argument(:id, ID, required: true)
    argument(:attributes, Types::EditAuthorAttributesType, required: true)

    def resolve(id:, attributes:)
      # POP QUIZ AGAIN what's missing here?

      # in the real world, this is probably a call to some service class
      author = Author.find_by(id: id)

      author.update!(name: attributes.name)

      return author
    end
  end
end
