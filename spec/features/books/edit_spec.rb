require "rails_helper"

RSpec.describe "Edit Book" do
  before(:each) do 
    @library_1 = Library.create!(system_name: "Denver Public Library",
                                branch_name: "Pauline Robinson",
                                has_study_rooms: true,
                                num_public_computers: 10)
    @book_1 = @library_1.books.create!(barcode: 8374,
                                      author: "Andy Weir",
                                      title: "Project Hail Mary",
                                      on_shelf: false,
                                      ytd_circ: 10)                                
  end
  it "links to the edit page from the book's show page" do
    visit "/books/#{@book_1.id}"

    click_link("Update Book")
    expect(current_path).to eq("/books/#{@book_1.id}/edit")
  end

  it "can edit a book" do
    visit "/books/#{@book_1.id}/edit"
    save_and_open_page

    fill_in("Barcode", with: 2984)
    check("This book is available for checkout, on the shelf.")
    click_button("Update Book")

    expect(current_path).to eq("/books/#{@book_1.id}")
    expect(page).to have_content("2984")
    expect(page).to have_content("Available for checkout: yes")
  end
end