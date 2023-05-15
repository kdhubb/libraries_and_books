class Library < ApplicationRecord
  has_many :books, dependent: :delete_all

  def count_books
    self.books.count
  end

  def self.order_branches_by_date
    order(created_at: :desc)
  end

  def self.sort_num_books(sort_param)
    if sort_param == "true"
      order(books_count: :desc)
    else
      all 
    end
  end
end