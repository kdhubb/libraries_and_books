require "rails_helper"

RSpec.describe "Library Book creation" do
  before(:each) do 
    @library_1 = Library.create!(system_name: "Denver Public Library",
                                branch_name: "Pauline Robinson",
                                has_study_rooms: true,
                                num_public_computers: 10)
  end

  it "links to the new page from the library show page" do
    visit "/libraries/#{@library_1.id}/books"

    click_link("Add Book")
    expect(current_path).to eq("/libraries/#{@library_1.id}/books/new")
  end

  it "can create a new book" do
    visit "/libraries/#{@library_1.id}/books/new"

    fill_in("Barcode", with: 8936)
    fill_in("Author", with: "Eloghosa Osunde")
    fill_in("Title", with: "Vagabonds!")
    check("This book is available for checkout, on the shelf.")
    fill_in("Number of circulations so far this year:", with: 6)
    click_button("Add Book")

    expect(current_path).to eq("/libraries/#{@library_1.id}/books")
    expect(page).to have_content("Vagabonds!")
  end
end