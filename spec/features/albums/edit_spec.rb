require "rails_helper"

RSpec.describe "Albums show" do
  before :each do
    @lcd = Artist.create!(name: "LCD Soundsystem", year_formed: "2002", touring: false)
    @pup = Artist.create!(name: "PUP", year_formed: "2010", touring: true)
    @lcd_self_titled = @lcd.albums.create!(title: "LCD Soundsystem", ep: false, number_of_songs: 16, year_released: 2005)
    @morbid = @pup.albums.create!(title: "Morbid Stuff", ep: false, number_of_songs: 11, year_released: 2019)
  end

  describe "As I visitor" do
    describe "when I visit /albums/:id/edit" do
      it "I see a form to edit the albums's attributes and can submit updated info" do
        visit "/albums/#{@lcd_self_titled.id}/edit"

        expect(page).to have_content("Album Title:")
        
        check "ep"

        click_on "Update Album"

        expect(current_path).to eq("/albums/#{@lcd_self_titled.id}")
        expect(page).to have_content("(EP)")

        click_on "Update Album"

        uncheck "ep"
        click_on "Update Album"

        expect(page).not_to have_content("(EP)")
      end
    end
  end
end