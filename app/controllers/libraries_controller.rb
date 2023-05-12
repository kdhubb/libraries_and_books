class LibrariesController < ApplicationController
  def index 
    @libraries = Library.order_branches_by_date
  end

  def show
    @library = Library.find(params[:id])
    @count = @library.count_books
  end

  def new
  end

  def create
    Library.create!(library_params)
    
  end
end