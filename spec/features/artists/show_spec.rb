require "rails_helper"

RSpec.describe "Artists show" do
  before :each do
    @lcd = Artist.create!(name: "LCD Soundsystem", year_formed: "2002", touring: false)
    @pup = Artist.create!(name: "PUP", year_formed: "2010", touring: true)
  end

  describe "As a visitor" do
    describe "when I visit /artists/:id" do
      it "I see the artist with that id with the artist's attributes" do
        visit "/artists/#{@lcd.id}"

        expect(page).to have_content(@lcd.name)
        expect(page).to have_content(@lcd.year_formed)
        expect(page).to have_content(@lcd.touring?)
      end

      it "I see the number of albums the artist has" do
        visit "/artists/#{@lcd.id}"

        expect(page).to have_content(@lcd.albums.count)
      end

      it "I see working links to Artists Index and Albums Index on all pages" do
        visit "/artists/#{@lcd.id}"

        expect(page).to have_content("Artists Index")
        expect(page).to have_content("Albums Index")

        click_on "Artists Index"

        expect(current_path).to eq("/artists")
        expect(page).to have_content("Artists Index")
        expect(page).to have_content("Albums Index")

        click_on "Albums Index"

        expect(current_path).to eq("/albums")
      end

      it "I see a link to take me to an index of their albums" do
        visit "/artists/#{@lcd.id}"

        expect(page).to have_content("Albums by #{@lcd.name}")

        click_on "Albums by #{@lcd.name}"

        expect(current_path).to eq("/artists/#{@lcd.id}/albums")
      end

      it "I see a link to update the artist" do
        visit "/artists/#{@lcd.id}"

        expect(page).to have_content("Update Artist")

        click_on "Update Artist"

        expect(current_path).to eq("/artists/#{@lcd.id}/edit")
      end
    end
  end
end