class LibraryBooksController < ApplicationController
  def index
    @library = Library.find(params[:id])
    require 'pry'; binding.pry
    @library_books = @library.books.display_sort
  end

  def new
    @library = Library.find(params[:id])
  end

  def create
    library = Library.find(params[:id])
    library.books.create!(book_params)
    redirect_to "/libraries/#{library.id}/books"
  end

  def sorted
    library = Library.find(params[:id])
    @sorted_books = library.books.sort_by_author
  end

  private
  def book_params
    params.permit(:barcode, :author, :title, :on_shelf, :ytd_circ)
  end
end