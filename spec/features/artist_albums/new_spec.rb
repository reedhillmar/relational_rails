RSpec.describe "Artist albums index" do
  before :each do
    @lcd = Artist.create!(name: "LCD Soundsystem", year_formed: "2002", touring: false)
    @pup = Artist.create!(name: "PUP", year_formed: "2010", touring: true)
    @lcd_self_titled = @lcd.albums.create!(title: "LCD Soundsystem", ep: false, number_of_songs: 16, year_released: 2005)
    @morbid = @pup.albums.create!(title: "Morbid Stuff", ep: false, number_of_songs: 11, year_released: 2019)
  end

  describe "As a visitor" do
    describe "when I visit/artists/:id/albums/new" do
      it "I can fill a form to create a new album by the artist" do
        visit "/artists/#{@lcd.id}/albums/new"

        fill_in "title", with: "North American Scum EP"
        fill_in "number_of_songs", with: "3"
        fill_in "year_released", with: "2007"
        check "ep"

        click_on "Create Album"

        expect(current_path).to eq("/artists/#{@lcd.id}/albums")
        expect(page).to have_content("North American Scum EP")
      end
    end
  end
end