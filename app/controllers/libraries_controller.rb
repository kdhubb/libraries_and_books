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
    redirect_to "/libraries"
  end

  def edit
    @library = Library.find(params[:id])
  end

  def update
    library = Library.find(params[:id])
    library.update(library_params)
    redirect_to "/libraries"
  end

  private
  def library_params
    params.permit(:system_name, :branch_name, :has_study_rooms, :num_public_computers)
  end
end