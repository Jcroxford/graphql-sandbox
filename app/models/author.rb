class Author < ActiveRecord::Base
  belongs_to :genre
  has_many :books
end
