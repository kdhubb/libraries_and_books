class BooksController < ApplicationController
  def index
    @books_on_shelf = Book.show_on_shelf
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to "/books/#{book.id}"
  end

  def destroy
    Book.destroy(params[:id])
    redirect_to "/books"
  end

  private
  def book_params
    params.permit(:barcode, :author, :title, :on_shelf, :ytd_circ)
  end
end