class Book < ApplicationRecord
  belongs_to :library

  def self.show_on_shelf
    all.where(on_shelf: true)
  end

  def self.sort_by_author
    order(:author)
  end

  # def self.display_sort
  #   if params[:sort_author] == true
  #     self.sort_by_author
  #   end
  # end
  # params are not here - only in controllers
end