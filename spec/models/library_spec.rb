require "rails_helper" 

RSpec.describe Library, type: :model do 
  describe "validations" do 
    it {should have_many(:books)}
  end
end