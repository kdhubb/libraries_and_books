class Book < ApplicationRecord
  belongs_to :library

  def self.show_on_shelf
    all.where(on_shelf: true)
  end
end