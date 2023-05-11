class LibraryBooksController < ApplicationController
  def index
    @library = Library.find(params[:id])
  end
end