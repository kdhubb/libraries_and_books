require "rails_helper"

RSpec.describe "books show page", type: :feature do 
# [ ] done

# User Story 4, Child Show 

# As a visitor
# When I visit '/child_table_name/:id'
# Then I see the child with that id including the child's attributes
# (data from each column that is on the child table)
  it "displays all attributes of the given book" do 
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
    
    visit "/books/#{book_1.id}"
    # save_and_open_page

    expect(page).to have_content(book_1.barcode)
    expect(page).to have_content(book_1.author)
    expect(page).to have_content(book_1.title)
    expect(page).to have_content("Available for checkout: no")
    expect(page).to have_content(book_1.ytd_circ)
    expect(page).to_not have_content(book_2.title)
    expect(page).to_not have_content(book_2.author)
  end
end