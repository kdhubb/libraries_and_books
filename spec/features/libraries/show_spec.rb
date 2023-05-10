require "rails_helper"

RSpec.describe "libraries index page", type: :feature do 
  # [ ] done

  # User Story 2, Parent Show 
  
  # As a visitor
  # When I visit '/parents/:id'
  # Then I see the parent with that id including the parent's attributes
  # (data from each column that is on the parent table)

  it "diplays a given library's attributes on a show page" do 
    library_1 = Library.create!(system_name: "Denver Public Library",
                                branch_name: "Pauline Robinson",
                                has_study_rooms: true,
                                num_public_computers: 10)
    library_2 = Library.create!(system_name: "Denver Public Library",
                                branch_name: "Athmar Park",
                                has_study_rooms: true,
                                num_public_computers: 15)
                          
    visit "/libraries/#{library_1.id}"
    save_and_open_page

    expect(page).to have_content(library_1.system_name)
    expect(page).to_not have_content(library_2.branch_name)
    expect(page).to have_content(library_1.branch_name)
    expect(page).to have_content("This branch has study rooms.")
    expect(page).to have_content(library_1.num_public_computers)
  end
end