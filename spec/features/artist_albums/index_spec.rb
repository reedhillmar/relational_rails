require "rails_helper"

RSpec.describe "Artist albums index" do
  before :each do
    @lcd = Artist.create!(name: "LCD Soundsystem", year_formed: "2002", touring: false)
    @pup = Artist.create!(name: "PUP", year_formed: "2010", touring: true)
    @lcd_self_titled = @lcd.albums.create!(title: "LCD Soundsystem", ep: false, number_of_songs: 16, year_released: 2005)
    @morbid = @pup.albums.create!(title: "Morbid Stuff", ep: false, number_of_songs: 11, year_released: 2019)
    @american_dream = @lcd.albums.create!(title: "American Dream", ep: false, number_of_songs: 11, year_released: 2017)
    @north_american = @lcd.albums.create!(title: "North American Scum EP", ep: true, number_of_songs: 3, year_released: 2007)
  end

  describe "As a visitor" do
    describe "when I visit /artists/:id/albums" do
      it "I see the name of each album by that artist in the system with the album details" do
        visit "/artists/#{@lcd.id}/albums"

        expect(page).to have_content(@lcd_self_titled.title)
        expect(page).to have_content(@lcd_self_titled.artist.name)
        expect(page).to have_content(@lcd_self_titled.ep?)
        expect(page).to have_content(@lcd_self_titled.number_of_songs)
        expect(page).to have_content(@lcd_self_titled.year_released)
      end

      it "I see a link to add a new album" do
        visit "/artists/#{@lcd.id}/albums"

        expect(page).to have_content("Create Album")

        click_on "Create Album"

        expect(current_path).to eq("/artists/#{@lcd.id}/albums/new")
      end

      it "I see a link that sorts albums alphabetically by title" do
        visit "/artists/#{@lcd.id}/albums"

        expect(page).to have_content("Sort Alphabetically")

        click_on "Sort Alphabetically"

        expect(@american_dream.title).to appear_before(@north_american.title)
      end

      it "I see a link that lets me only return records over a given threshold" do
        visit "/artists/#{@lcd.id}/albums"

        fill_in "threshold", with: 2007

        click_on "Submit"

        expect(page).to have_content(@north_american.year_released)
        expect(page).not_to have_content(@lcd_self_titled.year_released)
      end

      it "I can search for exact and partial matches" do
        visit "/artists/#{@lcd.id}/albums"

        fill_in "partial", with: "American"
        
        click_on "Search (partial)"

        expect(page).to have_content(@american_dream.title)
        expect(page).to have_content(@north_american.title)
        expect(page).not_to have_content("#{@lcd_self_titled.title} (LP)")

        fill_in "exact", with: "American"
        
        click_on "Search (exact)"

        expect(page).not_to have_content(@american_dream.title)

        fill_in "exact", with: "American Dream"
        
        click_on "Search (exact)"

        expect(page).to have_content(@american_dream.title)
      end
    end
  end
end