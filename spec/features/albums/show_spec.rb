require "rails_helper"

RSpec.describe "Albums show" do
  before :each do
    @lcd = Artist.create!(name: "LCD Soundsystem", year_formed: "2002", touring: false)
    @pup = Artist.create!(name: "PUP", year_formed: "2010", touring: true)
    @lcd_self_titled = @lcd.albums.create!(title: "LCD Soundsystem", ep: false, number_of_songs: 16, year_released: 2005)
    @morbid = @pup.albums.create!(title: "Morbid Stuff", ep: false, number_of_songs: 11, year_released: 2019)
  end

  describe "As a visitor" do
    describe "when I visit /albums/:id" do
      it "I see the name of each album in the system with the album details" do
        visit "/albums/#{@lcd_self_titled.id}"

        expect(page).to have_content(@lcd_self_titled.title)
        expect(page).to have_content(@lcd_self_titled.artist.name)
        expect(page).to have_content(@lcd_self_titled.ep?)
        expect(page).to have_content(@lcd_self_titled.number_of_songs)
        expect(page).to have_content(@lcd_self_titled.year_released)
      end

      it "I see a link to update the album" do
        visit "/albums/#{@lcd_self_titled.id}"

        expect(page).to have_content("Update Album")

        click_on "Update Album"

        expect(current_path).to eq("/albums/#{@lcd_self_titled.id}/edit")
      end

      it "I see a link to delete the album" do
        visit "/albums/#{@morbid.id}"

        expect(page).to have_content("Delete Album")

        click_on "Delete Album"

        expect(current_path).to eq("/albums")
        expect(page).not_to have_content("#{@morbid.title}")
      end
    end
  end
end