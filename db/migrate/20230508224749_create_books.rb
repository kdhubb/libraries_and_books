class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.integer :barcode
      t.text :author
      t.text :title
      t.boolean :on_shelf
      t.integer :ytd_circ
      t.references :library, null: false, foreign_key: true

      t.timestamps
    end
  end
end
