require "rails_helper"

RSpec.describe "Edit Library" do
  before(:each) do 
    @library_1 = Library.create!(system_name: "Denver Public Library",
                                branch_name: "Pauline Robinson",
                                has_study_rooms: true,
                                num_public_computers: 10)
  end
  it "links to the edit page from the library's show page" do
    visit "/libraries/#{@library_1.id}"

    click_link("Update Library")
    expect(current_path).to eq("/libraries/#{@library_1.id}/edit")
  end

  it "can edit a library" do
    visit "/libraries/#{@library_1.id}/edit"
    save_and_open_page

    fill_in("System Name:", with: "World Library of Noodles")
    fill_in("Branch Name:", with: "I has all the noods.")
    click_button("Update Library")

    expect(current_path).to eq("/libraries/#{@library_1.id}")
    expect(page).to have_content("I has all the noods.")
    expect(page).to have_content("World Library of Noodles")
  end
end