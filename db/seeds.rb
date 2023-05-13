# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

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
@book_5 = @library_1.books.create!(barcode: 4398,
                      author: "Kali Fajardo-Anstine",
                      title: "Sabrina and Corina",
                      on_shelf: true,
                      ytd_circ: 5)
