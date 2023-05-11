require "rails_helper"

RSpec.describe "A library's books index page", type: :feature do 
  # [ ] done

  # User Story 5, Parent Children Index 
  
  # As a visitor
  # When I visit '/parents/:parent_id/child_table_name'
  # Then I see each Child that is associated with that Parent with each Child's attributes
  # (data from each column that is on the child table)
  it "displays all attributes of all books at a given library" do 
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
    book_2 = library_2.books.create!(barcode: 9274,
                                      author: "Louise Erdrich",
                                      title: "The Night Watchman",
                                      on_shelf: true,
                                      ytd_circ: 3)
    book_3 = library_1.books.create!(barcode: 8353,
                                      author: "Octavia Butler",
                                      title: "Dawn",
                                      on_shelf: true,
                                      ytd_circ: 3)
    book_4 = library_2.books.create!(barcode: 9221,
                                      author: "Viet Thanh Nguyen",
                                      title: "The Sympathizer",
                                      on_shelf: true,
                                      ytd_circ: 2)
    
    visit "/libraries/#{library_1.id}/books"
    save_and_open_page

    expect(page).to have_content("Barcode: #{book_1.barcode}")
    expect(page).to have_content("Author: #{book_1.author}")
    expect(page).to have_content("Title: #{book_1.title}")
    expect(page).to have_content("Available for checkout: no")
    expect(page).to have_content("Checkouts this year: #{book_1.ytd_circ}")
    expect(page).to have_content("Barcode: #{book_3.barcode}")
    expect(page).to have_content("Author: #{book_3.author}")
    expect(page).to have_content("Title: #{book_3.title}")
    expect(page).to have_content("Available for checkout: yes")
    expect(page).to have_content("Checkouts this year: #{book_3.ytd_circ}")
    expect(page).to_not have_content(book_2.title)
    expect(page).to_not have_content(book_2.author)
    expect(page).to have_content("All Books")
    expect(page).to have_content("All Libraries")
  end
end
