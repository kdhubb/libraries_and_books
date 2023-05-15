class AddBooksCountToLibraries < ActiveRecord::Migration[7.0]
  def change
    add_column :libraries, :books_count, :integer
  end
end
