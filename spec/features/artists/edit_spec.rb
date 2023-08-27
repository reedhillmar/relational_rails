require "rails_helper"

RSpec.describe "Artists show" do
  before :each do
    @lcd = Artist.create!(name: "LCD Soundsystem", year_formed: "2002", touring: false)
    @pup = Artist.create!(name: "PUP", year_formed: "2010", touring: true)
  end

  describe "As a visitor" do
    describe "when I visit /artists/:id/edit" do
      it "I see a form to edit the artist's attributes and can submit updated info" do
        visit "/artists/#{@lcd.id}/edit"

        expect(page).to have_content("Artist Name:")

        check "touring"

        click_on "Update Artist"

        expect(current_path).to eq("/artists/#{@lcd.id}")
        expect(page).to have_content("is touring!")

        click_on "Update Artist"

        uncheck "touring"
        click_on "Update Artist"

        expect(current_path).to eq("/artists/#{@lcd.id}")
        expect(page).to have_content("not touring :(")
      end
    end
  end
end