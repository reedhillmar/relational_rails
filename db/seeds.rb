# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@lcd = Artist.create!(name: "LCD Soundsystem", year_formed: "2002", touring: false)
@pup = Artist.create!(name: "PUP", year_formed: "2010", touring: true)
@lcd_self_titled = @lcd.albums.create!(title: "LCD Soundsystem", ep: false, number_of_songs: 16, year_released: 2005)
@morbid = @pup.albums.create!(title: "Morbid Stuff", ep: false, number_of_songs: 11, year_released: 2019)
