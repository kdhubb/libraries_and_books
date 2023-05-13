class LibraryBooksController < ApplicationController
  def index
    @library = Library.find(params[:id])
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
end