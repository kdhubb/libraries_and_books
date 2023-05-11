
require "rails_helper"

RSpec.describe "libraries index page", type: :feature do 
  it "diplays the system and branch name of each library" do 
    library_1 = Library.create!(system_name: "Denver Public Library",
                                branch_name: "Pauline Robinson",
                                has_study_rooms: true,
                                num_public_computers: 10)
    library_2 = Library.create!(system_name: "Denver Public Library",
                                branch_name: "Athmar Park",
                                has_study_rooms: true,
                                num_public_computers: 15)
                          
    visit "/libraries"
    # save_and_open_page

    expect(page).to have_content(library_1.system_name)
    expect(page).to have_content(library_2.system_name)
    expect(page).to have_content(library_1.branch_name)
    expect(page).to have_content(library_2.branch_name)
    expect(page).to have_content(library_1.created_at)
    expect(page).to have_content(library_2.created_at)
  end
end