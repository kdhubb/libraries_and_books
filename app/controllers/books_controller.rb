class BooksController < ApplicationController
  def index
    @books = Book.all
    
  end

  def show
    require 'pry'; binding.pry
    @book = Book.find(params[:id])
    @owner_name = (Library.find_by(id: @book.library_id)).branch_name
  end
end