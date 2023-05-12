
# User Story 12, Parent Update 

# As a visitor
# When I visit a parent show page
# Then I see a link to update the parent "Update Parent"
# When I click the link "Update Parent"
# Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info

require "rails_helper"

RSpec.describe "Edit Library" do
  before(:each) do 
    library_1 = Library.create!(system_name: "Denver Public Library",
                                branch_name: "Pauline Robinson",
                                has_study_rooms: true,
                                num_public_computers: 10)
    library_2 = Library.create!(system_name: "Denver Public Library",
                                branch_name: "Athmar Park",
                                has_study_rooms: true,
                                num_public_computers: 15)
  end
  it "links to the new page from the libraries index" do
    visit "/libraries/#{library_1.id}"

    click_link("Edit Library")
    expect(current_path).to eq("/libraries/#{library_1.id}/edit")
  end

  it "can edit a library" do
    "/libraries/#{library_1.id}/edit"
    save_and_open_page

    fill_in("System Name:", with: "World Library of Noodles")
    fill_in("Branch Name:", with: "I has all the noods.")
    click_button("Edit Library")

    expect(current_path).to eq("/libraries")
    expect(page).to have_content("I has all the noods.")
    expect(page).to have_content("World Library of Noodles")
  end
end