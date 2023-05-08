class CreateLibraries < ActiveRecord::Migration[7.0]
  def change
    create_table :libraries do |t|
      t.text :system_name
      t.text :branch_name
      t.boolean :has_study_rooms
      t.integer :num_public_computers

      t.timestamps
    end
  end
end
