require "rails_helper" 

RSpec.describe Library, type: :model do 
  before(:each) do 
    @library_1 = Library.create!(system_name: "Denver Public Library",
                                  branch_name: "Pauline Robinson",
                                  has_study_rooms: true,
                                  num_public_computers: 10,
                                  created_at: "Mon, 15 May 2023 03:49:33.258657000 UTC +00:00",
                                  updated_at: "Mon, 15 May 2023 03:49:33.258657000 UTC +00:00")
    @library_2 = Library.create!(system_name: "Denver Public Library",
                                  branch_name: "Athmar Park",
                                  has_study_rooms: true,
                                  num_public_computers: 15)
    @book_1 = @library_1.books.create!(barcode: 8374,
                                        author: "Andy Weir",
                                        title: "Project Hail Mary",
                                        on_shelf: false,
                                        ytd_circ: 10,
                                        created_at: "Sun, 14 May 2023 03:49:33.258657000 UTC +00:00",
                                        updated_at: "Sun, 14 May 2023 03:49:33.258657000 UTC +00:00")
    @book_3 = @library_1.books.create!(barcode: 8353,
                                        author: "Octavia Butler",
                                        title: "Dawn",
                                        on_shelf: false,
                                        ytd_circ: 3,
                                        created_at: "Mon, 15 May 2023 03:49:33.258657000 UTC +00:00",
                                        updated_at: "Mon, 15 May 2023 03:49:33.258657000 UTC +00:00")
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
    @book_5 = @library_1.books.create!(barcode: 4876,
                                        author: "Jon Krakauer",
                                        title: "Into Thin Air",
                                        on_shelf: true,
                                        ytd_circ: 7)
  end
  describe "validations" do 
    it {should have_many(:books)}
  end

  describe "instance methods" do 
    it "#count_books" do 
      expect(@library_1.count_books).to eq(3)
      expect(@library_2.count_books).to eq(2)
    end
  end

  describe "class methods" do 
    it "order_branches_by_date" do 
      expect(Library.order_branches_by_date).to eq([@library_2, @library_1])
    end

    it "sort_num_books" do 
      # sorts libraries by the number of books they have in descending order.
      expect(Library.sort_num_books("true")).to eq([@library_1, @library_2])
      expect(Library.sort_num_books("foo")).to match_array([@library_1, @library_2])
    end
  end
end