#   User Story 11, Parent Creation 

# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to "/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.

require "rails_helper"

RSpec.describe "Library creation" do
  it "links to the new page from the libraries index" do
    visit libraries_path

    click_link("New Library")
    expect(current_path).to eq("/libraries/new")
  end

  xit "can create a new library" do
    visit new_libraries_path

    fill_in("System Name", with: "Boulder Public Library")
    fill_in("Branch Name", with: "Meadows")
    # how to write tests for radio button or drop down options?
    fill_in("Does this branch have study rooms?", with: false)
    fill_in("Number of public computers:", with: 5)
    click_button("Create Library")

    expect(current_path).to eq("/libraries")
    expect(page).to have_content("Meadows")
  end
end