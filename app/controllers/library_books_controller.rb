class LibraryBooksController < ApplicationController
  def index
    @library = Library.find(params[:id])
    @library_books = @library.books.sort_by_author(params[:sort_author]).filter_circs(search_params[:filter_circs])
  end

  def new
    @library = Library.find(params[:id])
  end

  def create
    library = Library.find(params[:id])
    library.books.create!(book_params)
    redirect_to "/libraries/#{library.id}/books"
  end

  private
  def book_params
    params.permit(:barcode, :author, :title, :on_shelf, :ytd_circ)
  end

  def search_params
    params.permit(:filter_circs, :ytd_circ)
  end
end