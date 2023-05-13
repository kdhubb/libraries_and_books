# [ ] done

# User Story 13, Parent Child Creation 

# As a visitor
# When I visit a Parent Children Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed

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

  it "can create a new library" do
    visit "/libraries/#{@library_1.id}/books/new"
    save_and_open_page

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