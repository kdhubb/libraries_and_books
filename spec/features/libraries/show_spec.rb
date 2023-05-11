require "rails_helper"

RSpec.describe "libraries index page", type: :feature do 
  it "diplays a given library's attributes on a show page" do 
    library_1 = Library.create!(system_name: "Denver Public Library",
                                branch_name: "Pauline Robinson",
                                has_study_rooms: true,
                                num_public_computers: 10)
    library_2 = Library.create!(system_name: "Denver Public Library",
                                branch_name: "Athmar Park",
                                has_study_rooms: true,
                                num_public_computers: 15)
    book_1 = library_1.books.create!(barcode: 8374,
                                      author: "Andy Weir",
                                      title: "Project Hail Mary",
                                      on_shelf: false,
                                      ytd_circ: 10)  
    book_3 = library_1.books.create!(barcode: 8353,
                                      author: "Octavia Butler",
                                      title: "Dawn",
                                      on_shelf: false,
                                      ytd_circ: 3)                                                                    
                          
    visit "/libraries/#{library_1.id}"
    save_and_open_page

    expect(page).to have_content(library_1.system_name)
    expect(page).to_not have_content(library_2.branch_name)
    expect(page).to have_content(library_1.branch_name)
    expect(page).to have_content("This branch has study rooms.")
    expect(page).to have_content(library_1.num_public_computers)
    expect(page).to have_content("Number of Books: 2")
    # Look for testing language to test for link locations
    expect(page).to have_content("Browse books at Pauline Robinson Branch Library")
  end
end