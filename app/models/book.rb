class Book < ApplicationRecord
  belongs_to :library
  self.primary_key = "id"
end