class LibrariesController < ApplicationController
  def index 
    @libraries = Library.order(:created_at)
  end

  def show
    @library = Library.find(params[:id])
    @count = @library.count_books
  end
end