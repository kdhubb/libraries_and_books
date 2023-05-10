require "rails_helper"

RSpec.describe "books index page", type: :feature do 
  # [ ] done

  # User Story 3, Child Index 
  
  # As a visitor
  # When I visit '/child_table_name'
  # Then I see each Child in the system including the Child's attributes
  # (data from each column that is on the child table)
  it "diplays all books in the database with their attributes for all libraries" do 
    library_1 = Library.create!(system_name: "Denver Public Library",
                                branch_name: "Pauline Robinson",
                                has_study_rooms: true,
                                num_public_computers: 10)
    library_2 = Library.create!(system_name: "Denver Public Library",
                                branch_name: "Athmar Park",
                                has_study_rooms: true,
                                num_public_computers: 15)
    book_1 = Book.create!(barcode: 8374,
                          author: "Andy Weir",
                          title: "Project Hail Mary",
                          on_shelf: false,
                          ytd_circ: 10,
                          library_id: 1)
    book_2 = Book.create!(barcode: 9274,
                          author: "Louise Erdrich",
                          title: "The Night Watchman",
                          on_shelf: true,
                          ytd_circ: 3,
                          library_id: 2)
                          
    visit "/books"
    save_and_open_page

    expect(page).to have_content(book_1.barcode)
    expect(page).to have_content(book_1.author)
    expect(page).to have_content(book_1.title)
    expect(page).to have_content(book_1.on_shelf)
    expect(page).to have_content(book_1.ytd_circ)
    expect(page).to have_content(book_2.barcode)
    expect(page).to have_content(book_2.author)
    expect(page).to have_content(book_2.title)
    expect(page).to have_content(book_2.on_shelf)
    expect(page).to have_content(book_2.ytd_circ)
  end
end