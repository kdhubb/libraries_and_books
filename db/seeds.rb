Library.destroy_all

@library_1 = Library.create!(system_name: "Denver Public Library",
                            branch_name: "Pauline Robinson",
                            has_study_rooms: true,
                            num_public_computers: 10)
@library_2 = Library.create!(system_name: "Denver Public Library",
                            branch_name: "Athmar Park",
                            has_study_rooms: true,
                            num_public_computers: 15,
                            created_at: "Mon, 15 May 2023 03:49:33.258657000 UTC +00:00",
                            updated_at: "Mon, 15 May 2023 03:49:33.258657000 UTC +00:00")
@book_1 = @library_1.books.create!(barcode: 8374,
                      author: "Andy Weir",
                      title: "Project Hail Mary",
                      on_shelf: false,
                      ytd_circ: 10,
                      created_at: "Mon, 15 May 2023 03:49:33.258657000 UTC +00:00",
                      updated_at: "Mon, 15 May 2023 03:49:33.258657000 UTC +00:00")
@book_3 = @library_1.books.create!(barcode: 8353,
                      author: "Octavia Butler",
                      title: "Dawn",
                      on_shelf: false,
                      ytd_circ: 3)
@book_2 = @library_2.books.create!(barcode: 9274,
                      author: "Louise Erdrich",
                      title: "The Night Watchman",
                      on_shelf: true,
                      ytd_circ: 3,
                      created_at: "Sun, 14 May 2023 03:49:33.258657000 UTC +00:00",
                      updated_at: "Sun, 14 May 2023 03:49:33.258657000 UTC +00:00")
@book_4 = @library_2.books.create!(barcode: 9221,
                      author: "Viet Thanh Nguyen",
                      title: "The Sympathizer",
                      on_shelf: true,
                      ytd_circ: 2)
@book_5 = @library_1.books.create!(barcode: 4398,
                      author: "Kali Fajardo-Anstine",
                      title: "Sabrina and Corina",
                      on_shelf: true,
                      ytd_circ: 5)
@book_6 = @library_2.books.create!(barcode: 3987,
                      author: "David Sedaris",
                      title: "When You Are Engulfed in Flames",
                      on_shelf: false,
                      ytd_circ: 7)
@book_7 = @library_2.books.create!(barcode: 3976,
                      author: "Allie Brosh",
                      title: "Hyperbole and A Half",
                      on_shelf: false,
                      ytd_circ: 4)
@book_8 = @library_1.books.create!(barcode: 3976,
                      author: "Miranda July",
                      title: "No One Belongs Here More Than You.",
                      on_shelf: true,
                      ytd_circ: 2)

