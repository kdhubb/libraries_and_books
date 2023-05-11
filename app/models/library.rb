class Library < ApplicationRecord
  has_many :books

  def count_books
    self.books.count
  end

  def order_branches_by_date
    self.order(:created_at)
  end
end