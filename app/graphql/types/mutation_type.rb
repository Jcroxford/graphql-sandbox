module Types
  class MutationType < Types::BaseObject
    field(:edit_author, mutation: Mutations::EditAuthorMutation)
  end
end
