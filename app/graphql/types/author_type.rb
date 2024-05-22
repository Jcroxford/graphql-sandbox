module Types
  class AuthorType < Types::BaseObject
    description("An author. You know, like a writer.")

    field(:id, ID, null: false)
    field(:name, String, null: false)

    # ========================================================================
    # begin several list field examples
    # ========================================================================
    # The most basic list type is strictly just defining a field as an array
    # and then returning that array
    #
    # field(:books, [Types::BookType], null: false)

    # In this case, this function is optional because the author model has a
    # function (has_many :books) that responds to a call for books
    # I can tell you don't believe me. I dare you to comment it out and see.
    #
    # It's here to depict another approach and expose a global variable in gql
    # "object". object is what graphql call's the thing the type class is given
    # at run time to resolve any requested fields for this class. It's provided
    # by whatever parent lead us to request data from this class.
    # e.g. if we make a root level "author" query, the resolver for that query
    # returned an ActiveRecord Author model. In this scenario for this books
    # function, the Author active record model is what "object" would be.
    #
    # def books
    #   object.books
    # end

    # ________________________________________________________________________

    # in this case, we are wrapping our book array in a standard "connection"
    # type. This returns our book type with some pagination helpers.
    #
    # similar to above, defining a resolver function is optional because the
    # author model already defines a "books" function
    #
    # field(:books, Types::BookType.connection_type, null: false)

    # ________________________________________________________________________

    # you can use the connection_type function to handle pagination and add
    # additional custom arguments that you handle in a resolver fucntion
    # like shown below. This isn't common in our app because we typically use
    # custom connection classes that are more focused and reusable (next example)
    #
    # field(:books, Types::BookType.connection_type, null: false) do
    #   argument(:search, String, required: false)
    # end

    # def books(search: nil)
    #   object.books.where("title like ?", "#{search}%")
    # end

    # ________________________________________________________________________

    # you can define custom resolvers classes on any field. In this case,
    # we are encapsulating pagination and filtering arguments with this resolver
    # instead of defining them in line like the previous examples
    #
    field(:books, resolver: Resolvers::BooksResolver)

    # ========================================================================
    # end several author field examples
    # ========================================================================
  end
end