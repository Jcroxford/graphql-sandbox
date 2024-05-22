module Types
  class BookType < Types::BaseObject
    description("sometimes authors get inspired and do a thing. This is that thing.")

    field(:id, ID, null: false)
    field(:title, String, null: false)
    field(:author, Types::AuthorType, null: false)
  end
end