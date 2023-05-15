require "rails_helper"

RSpec.describe "books index page", type: :feature do 
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
                                      ytd_circ: 10,
                                      library_id: @library_1.id)
    @book_2 = @library_1.books.create!(barcode: 9274,
                                      author: "Louise Erdrich",
                                      title: "The Night Watchman",
                                      on_shelf: true,
                                      ytd_circ: 3,
                                      library_id: @library_2.id)
    end
  
  it "links to the edit page for each book from the books index page" do
    visit "/books"

    click_link("Edit The Night Watchman")
    expect(current_path).to eq("/books/#{@book_2.id}/edit")
  end

  it "links to the show page for each book from the books index page" do
    visit "/books"

    click_link("Title: The Night Watchman")
    expect(current_path).to eq("/books/#{@book_2.id}")
  end

  it "delete button deletes book and redirects to books index" do
    visit "/books"

    click_link("Delete #{@book_2.title}")
    expect(current_path).to eq("/books")
    expect(page).to_not have_content("The Night Watchman")
  end

  it "diplays all books in the database with their attributes for all libraries" do 
    visit "/books"

    expect(page).to have_content(@book_2.barcode)
    expect(page).to have_content(@book_2.author)
    expect(page).to have_content(@book_2.title)
    expect(page).to have_content("Available for checkout: yes")
    expect(page).to have_content(@book_2.ytd_circ)
    expect(page).to_not have_content(@book_1.barcode)
    expect(page).to_not have_content(@book_1.author)
    expect(page).to_not have_content(@book_1.title)
    expect(page).to_not have_content("Available for checkout: no")
    expect(page).to_not have_content(@book_1.ytd_circ)
  end
end