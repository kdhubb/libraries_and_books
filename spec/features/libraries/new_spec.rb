require "rails_helper"

RSpec.describe "Library creation" do
  it "links to the new page from the libraries index" do
    visit libraries_path

    click_link("New Library")
    expect(current_path).to eq("/libraries/new")
  end

  it "can create a new library" do
    visit libraries_new_path

    fill_in("System Name:", with: "Boulder Public Library")
    fill_in("Branch Name:", with: "Meadows")
    check("This library has study rooms.")
    fill_in("Number of Public Computers:", with: 5)
    click_button("Create Library")

    expect(current_path).to eq("/libraries")
    expect(page).to have_content("Meadows")
    expect(page).to have_content("5")
    expect(page).to have_content("Boulder Public Library")
  end
end