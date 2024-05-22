require 'search_object'
require 'search_object/plugin/graphql'

module Resolvers
  class BooksResolver < Resolvers::BaseResolver
    type(Types::BookType.connection_type, null: true)

    argument(:search, String, required: false)

    def resolve(search: nil)
      # POP QUIZ: what's missing here that we _always_ want in the real world?
      # 2 right answers...
      books = object.books

      books = apply_search(books: books, search: search) if search.present?

      return books
    end

    private
    def apply_search(books:, search:)
      return books.where("title like ?", "#{search}%")
    end
  end
end

# this is more similar to what we use for pagination in production. we have a class that extends
# the library `search_object` that provides a standard interface for defining fields to search
# by on an active record model.
# module Resolvers
#   class BooksResolver < Resolvers::BaseResolver
#     include SearchObject.module(:graphql)
#     type(Types::BookType.connection_type, null: true)

#     scope { object.books }

#     option(:search, type: String, with: :apply_search)

#     private
#     def apply_search(scope, value)
#       return scope.where("title like ?", "#{search}%")
#     end
#   end
# end
