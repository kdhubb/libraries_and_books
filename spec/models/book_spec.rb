require "rails_helper"

RSpec.describe Book, type: :model do 
    describe "relationships" do 
      it {should belong_to(:library)}
  end
  before(:each) do 
    @library_1 = Library.create!(system_name: "Denver Public Library",
                                  branch_name: "Pauline Robinson",
                                  has_study_rooms: true,
                                  num_public_computers: 10)
    @library_2 = Library.create!(system_name: "Denver Public Library",
                                  branch_name: "Athmar Park",
                                  has_study_rooms: true,
                                  num_public_computers: 15)
    @book_1 = @library_1.books.create!(barcode: 8374,
                                        author: "Andy Weir",
                                        title: "Project Hail Mary",
                                        on_shelf: false,
                                        ytd_circ: 10)
    @book_3 = @library_1.books.create!(barcode: 8353,
                                        author: "Octavia Butler",
                                        title: "Dawn",
                                        on_shelf: false,
                                        ytd_circ: 3)
    @book_2 = @library_2.books.create!(barcode: 9274,
                                        author: "Louise Erdrich",
                                        title: "The Night Watchman",
                                        on_shelf: true,
                                        ytd_circ: 3)
    @book_4 = @library_2.books.create!(barcode: 9221,
                                        author: "Viet Thanh Nguyen",
                                        title: "The Sympathizer",
                                        on_shelf: true,
                                        ytd_circ: 2)
  end
  describe "class methods" do 
    it "returns all books where on_shelf is true" do 
      expect(Book.show_on_shelf).to eq([@book_2, @book_4])
    end
  end
end