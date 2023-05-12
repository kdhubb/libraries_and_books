class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
  end

  def create
    library = Library.find(params[:id])
    library.books.create!(book_params)
    redirect_to "/libraries/id/books"
  end

  private
  def book_params
    params.permit(:barcode, :author, :title, :on_shelf, :ytd_circ)
  end
end