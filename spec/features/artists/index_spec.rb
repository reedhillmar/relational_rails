require "rails_helper"

RSpec.describe "Artists index" do
  before :each do
    @lcd = Artist.create!(name: "LCD Soundsystem", year_formed: "2002", touring: false)
    @pup = Artist.create!(name: "PUP", year_formed: "2010", touring: true)
  end

  describe "As a visitor" do
    describe "when I visit /artists" do
      it "I see the name of each artist in the system" do
        visit "/artists"

        expect(page).to have_content(@lcd.name)
        expect(page).to have_content(@pup.name)
      end

      it "I see artists are ordered by most recently created first with created time displayed" do
        visit "/artists"

        expect(page).to have_content(@lcd.name)
        expect(page).to have_content(@lcd.created_at)
        expect(page).to have_content(@pup.name)
        expect(page).to have_content(@pup.created_at)
        expect(@lcd.name).to appear_before(@pup.name)
      end
    end
  end
end