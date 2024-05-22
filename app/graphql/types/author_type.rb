module Types
  class AuthorType < Types::BaseObject
    description("An author. You know, like a writer.")

    field :id, ID, null: false
    field :name, String, null: false
  end
end