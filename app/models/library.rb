class Library < ApplicationRecord
  has_many :books

  def count_books
    self.books.count
  end
end