require "rails_helper" 

RSpec.describe Library, type: :model do 
  describe "validations" do 
    it {should have_many(:books)}
  end

#   [ ] done
# User Story 1, Parent Index 
# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system

  describe "library index page" do
    it "diplays the system and branch name of each library" do 
      library_1 = Library.create!(system_name: "Denver Public Library"
                                  branch_name: "Pauline Robinson"
                                  has_study_rooms: true
                                  num_public_computers: 10)
      library_2 = Library.create!(system_name: "Denver Public Library"
                                  branch_name: "Athmar Park"
                                  has_study_rooms: true
                                  num_public_computers: 15)
                            
      visit "/libraries"

      expect(page).to have_content(library_1.system_name)
      expect(page).to have_content(library_2.system_name)
      expect(page).to have_content(library_1.branch_name)
      expect(page).to have_content(library_2.branch_name)
    end
  end
end