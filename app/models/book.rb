class Book < ApplicationRecord
  belongs_to :library

  def self.show_on_shelf
    all.where(on_shelf: true)
  end

  def self.sort_by_author(sort_author_param)
    if sort_author_param == "true"
      order(:author)
    else 
      all
    end
  end
end