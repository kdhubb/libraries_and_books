class LibrariesController < ApplicationController
  def index 
    @libraries = Library.order_branches_by_date
  end

  def show
    @library = Library.find(params[:id])
    @count = @library.count_books
  end
end