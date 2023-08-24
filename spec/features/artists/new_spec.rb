require "rails_helper"

RSpec.describe "Artists new" do
  before :each do
    @lcd = Artist.create!(name: "LCD Soundsystem", year_formed: "2002", touring: false)
    @pup = Artist.create!(name: "PUP", year_formed: "2010", touring: true)
  end

  describe "As a visitor" do
    describe "when I visit /artists/new" do
      it "I can fill out a form with a new artist's attributes and create a new artist" do
        visit "/artists/new"

        expect(page).to have_content("Artist Name")
        expect(page).to have_content("Year Formed")

        fill_in "name", with: "The Strokes"
        fill_in "year_formed", with: "1998"

        click_on "Create Artist"

        expect(current_path).to eq("/artists")
        expect(page).to have_content("The Strokes")
      end
    end
  end
end