# User Story 21, Display Records Over a Given Threshold 

# As a visitor
# When I visit the Parent's children Index Page
# I see a form that allows me to input a number value
# When I input a number value and click the submit button that reads 'Only return records with more than `number` of `column_name`'
# Then I am brought back to the current index page with only the records that meet that threshold shown.
require "rails_helper"

RSpec.describe "A library's books index page", type: :feature do
  before(:each) do 
    @library_1 = Library.create!(system_name: "Denver Public Library",
                                branch_name: "Pauline Robinson",
                                has_study_rooms: true,
                                num_public_computers: 10)
    @library_2 = Library.create!(system_name: "Denver Public Library",
                                branch_name: "Athmar Park",
                                has_study_rooms: true,
                                num_public_computers: 15)
    @book_1 = @library_1.books.create!(barcode: 8353,
                                      author: "Octavia Butler",
                                      title: "Dawn",
                                      on_shelf: true,
                                      ytd_circ: 2)
    @book_2 = @library_2.books.create!(barcode: 9274,
                                      author: "Louise Erdrich",
                                      title: "The Night Watchman",
                                      on_shelf: true,
                                      ytd_circ: 3)
    @book_3 = @library_1.books.create!(barcode: 8374,
                                      author: "Andy Weir",
                                      title: "Project Hail Mary",
                                      on_shelf: false,
                                      ytd_circ: 10)
    @book_4 = @library_2.books.create!(barcode: 9221,
                                      author: "Viet Thanh Nguyen",
                                      title: "The Sympathizer",
                                      on_shelf: true,
                                      ytd_circ: 2)
  end

  it "links to the edit page for each book from the books index page" do
    visit "/libraries/#{@library_1.id}/books"

    click_link("Edit Dawn")
    expect(current_path).to eq("/books/#{@book_1.id}/edit")
  end

  it "links to display books with at minimum number of circs" do
    visit "/libraries/#{@library_1.id}/books"

    fill_in("Filter books with at least", with: 3).
    expect(current_path).to eq("/libraries/#{@library_1.id}/books?filter_circs=3")
    save_and_open_page
    expect(page).to have_content("Project Hail Mary")
    expect(page).to_not have_content("Dawn")
  end
  
  it "displays all attributes of all books at a given library" do 
    visit "/libraries/#{@library_1.id}/books"
    # visit "/libraries/#{@library_1.id}/books?sort_author=true"
    # save_and_open_page

    expect(page).to have_content("Barcode: #{@book_1.barcode}")
    expect(page).to have_content("Author: #{@book_1.author}")
    expect(page).to have_content("Title: #{@book_1.title}")
    expect(page).to have_content("Available for checkout: no")
    expect(page).to have_content("Checkouts this year: #{@book_1.ytd_circ}")
    expect(page).to have_content("Barcode: #{@book_3.barcode}")
    expect(page).to have_content("Author: #{@book_3.author}")
    expect(page).to have_content("Title: #{@book_3.title}")
    expect(page).to have_content("Available for checkout: yes")
    expect(page).to have_content("Checkouts this year: #{@book_3.ytd_circ}")
    expect(page).to_not have_content(@book_2.title)
    expect(page).to_not have_content(@book_2.author)
    expect(page).to have_content("All Books")
    expect(page).to have_content("All Libraries")
    expect(page).to have_content("Sort All Books by Author")
    expect(page).to have_content("Add Book")
  end
end
