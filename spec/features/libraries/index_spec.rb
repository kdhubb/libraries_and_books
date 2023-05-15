
require "rails_helper"

RSpec.describe "libraries index page", type: :feature do 
  before(:each) do 
    @library_1 = Library.create!(system_name: "Denver Public Library",
                                  branch_name: "Pauline Robinson",
                                  has_study_rooms: true,
                                  num_public_computers: 10)
    @library_2 = Library.create!(system_name: "Denver Public Library",
                                  branch_name: "Athmar Park",
                                  has_study_rooms: true,
                                  num_public_computers: 15)
    @book_1 = @library_1.books.create!(barcode: 8374,
                                        author: "Andy Weir",
                                        title: "Project Hail Mary",
                                        on_shelf: false,
                                        ytd_circ: 10)
    @book_2 = @library_2.books.create!(barcode: 9274,
                                        author: "Louise Erdrich",
                                        title: "The Night Watchman",
                                        on_shelf: true,
                                        ytd_circ: 3)
    end
  it "diplays the system and branch name of each library" do 
                          
    visit "/libraries"
    # save_and_open_page

    expect(page).to have_content("All Public Libraries")
    expect(page).to have_content("System: #{@library_1.system_name}")
    expect(page).to have_content("System: #{@library_2.system_name}")
    expect(page).to have_content("Library Branch: #{@library_1.branch_name}")
    expect(page).to have_content("Library Branch: #{@library_2.branch_name}")
    # Can a test be added for checking order of appearance for libraries on this page? Is this necessary? 
    expect(page).to have_content("Date Created: #{@library_1.created_at}")
    expect(page).to have_content("Date Created: #{@library_2.created_at}")
  end

  it "delete button deletes library and redirects to libraries index" do
    visit "/libraries"

    click_link("Delete Pauline Robinson Branch Library")
    expect(current_path).to eq("/libraries")
    # save_and_open_page
    expect(page).to_not have_content("Pauline Robinson")
    expect(Book.all).to eq([@book_2])
  end

  it "Branch name links to show page for each library" do
    visit "/libraries"

    save_and_open_page
    click_link("Library Branch: Pauline Robinson")
    expect(current_path).to eq("/libraries/#{@library_1.id}")
  end
end