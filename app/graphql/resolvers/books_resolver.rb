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
# TODO same class but using the search plugin thing
