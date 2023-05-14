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
  
  it "delete button deletes library and redirects to libraries index" do
    visit "/libraries/#{@library_1.id}"

    click_link("Delete Library")
    expect(current_path).to eq("/libraries")
    # save_and_open_page
    expect(page).to_not have_content("Pauline Robinson")
    expect(Book.all).to eq([@book_2])
  end

  it "diplays a given library's attributes on a show page" do 
    
    visit "/libraries/#{@library_1.id}"
    # save_and_open_page

    expect(page).to have_content("#{@library_1.system_name} System")
    expect(page).to_not have_content(@library_2.branch_name)
    expect(page).to have_content("#{@library_1.branch_name} Branch Library")
    expect(page).to have_content("This branch has study rooms.")
    expect(page).to have_content("Public Computers: #{@library_1.num_public_computers}")
    expect(page).to have_content("Number of Books: 1")
    # Look for testing language to test for link locations
    expect(page).to have_content("Browse books at #{@library_1.branch_name} Branch Library")
    expect(page).to have_content("Edit Library")
  end
end