require "rails_helper"

RSpec.describe "Albums index" do
  before :each do
    @lcd = Artist.create!(name: "LCD Soundsystem", year_formed: "2002", touring: false)
    @pup = Artist.create!(name: "PUP", year_formed: "2010", touring: true)
    @lcd_self_titled = @lcd.albums.create!(title: "LCD Soundsystem", ep: false, number_of_songs: 16, year_released: 2005)
    @morbid = @pup.albums.create!(title: "Morbid Stuff", ep: false, number_of_songs: 11, year_released: 2019)
    @n_a_s = @lcd.albums.create!(title: "North American Scum EP", ep: true, number_of_songs: 3, year_released: 2007)
  end

  describe "As a visitor" do
    describe "when I visit /albums" do
      it "I see the name of each album in the system with the album details" do
        visit "/albums"

        expect(page).to have_content(@lcd_self_titled.title)
        expect(page).to have_content(@lcd_self_titled.artist.name)
        expect(page).to have_content(@lcd_self_titled.ep?)
        expect(page).to have_content(@lcd_self_titled.number_of_songs)
        expect(page).to have_content(@lcd_self_titled.year_released)
      end

      it "I only see albums that are EPs" do
        visit "/albums"

        expect(page).to have_content(@n_a_s.title)
        expect(page).not_to have_content(@lcd_self_titled.number_of_songs)
      end
    end
  end
end