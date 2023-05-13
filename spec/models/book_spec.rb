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
    @book_3 = @library_1.books.create!(barcode: 8353,
                                        author: "Octavia Butler",
                                        title: "Dawn",
                                        on_shelf: false,
                                        ytd_circ: 3)
    @book_5 = @library_1.books.create!(barcode: 8374,
                                        author: "Andy Weir",
                                        title: "Project Hail Mary",
                                        on_shelf: false,
                                        ytd_circ: 10)
    @book_4 = @library_2.books.create!(barcode: 9221,
                                        author: "Viet Thanh Nguyen",
                                        title: "The Sympathizer",
                                        on_shelf: true,
                                        ytd_circ: 2)
    @book_2 = @library_2.books.create!(barcode: 9274,
                                        author: "Louise Erdrich",
                                        title: "The Night Watchman",
                                        on_shelf: true,
                                        ytd_circ: 3)
    @book_1 = @library_2.books.create!(barcode: 2987,
                                        author: "Kali Fajardo-Anstine",
                                        title: "Sabrina and Corina",
                                        on_shelf: true,
                                        ytd_circ: 5)
    
  end
  describe "class methods" do 
    it "show_on_shelf" do 
      # returns all books where on_shelf is true
      expect(Book.show_on_shelf).to eq([@book_4, @book_2, @book_1])
    end

    it "sort_by_author" do 
      # returns all books in alphabetical order by author
      expect(Book.sort_by_author("true")).to eq([@book_5, @book_1, @book_2, @book_3, @book_4])
      expect(Book.sort_by_author("foo")).to eq([@book_3, @book_5, @book_4, @book_2, @book_1])
    end
  end
end