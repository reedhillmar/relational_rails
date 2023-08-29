require "rails_helper"

RSpec.describe "Artists index" do
  before :each do
    @lcd = Artist.create!(name: "LCD Soundsystem", year_formed: "2002", touring: false)
    @pup = Artist.create!(name: "PUP", year_formed: "2010", touring: true)
    @american_dream = @lcd.albums.create!(title: "American Dream", ep: false, number_of_songs: 11, year_released: 2017)
    @morbid = @pup.albums.create!(title: "Morbid Stuff", ep: false, number_of_songs: 11, year_released: 2019)
    @unraveling = @pup.albums.create!(title: "THE UNRAVELING OF PUPTHEBAND", ep: false, number_of_songs: 12, year_released: 2022)
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

      it "I see a link to create a new artist that takes me to a new artist form" do
        visit "/artists"

        expect(page).to have_content("New Artist")

        click_on "New Artist"

        expect(current_path).to eq("/artists/new")
      end

      it "I see a link to edit an artist next to each artist" do
        visit "/artists"

        expect(page).to have_content("Update Artist")

        first(:link, "Update Artist").click

        expect(current_path).to eq("/artists/#{@lcd.id}/edit")
      end

      it "I see a link to delete an artist next to each artist" do
        visit "/artists"

        expect(page).to have_content("Delete Artist")

        first(:link, "Delete Artist").click

        expect(current_path).to eq("/artists")
        expect(page).not_to have_content(@lcd.name)
      end

      it "I see a link to sort artists by number of albums they have" do
        visit "/artists"

        expect(page).to have_content("Sort by Albums Released")

        click_on "Sort by Albums Released"

        expect(current_path).to eq("/artists")

        expect(@pup.name).to appear_before(@lcd.name)
        expect(page).to have_content("#{@pup.name} (#{@pup.albums.count} albums)")
      end

      it "I can search for exact and partial matches" do
        visit "/artists"

        fill_in "partial", with: "LCD"
        
        click_on "Search (partial)"

        expect(page).to have_content(@lcd.name)
        expect(page).not_to have_content(@pup.name)

        fill_in "exact", with: "LCD"
        
        click_on "Search (exact)"

        expect(page).not_to have_content(@lcd.name)

        fill_in "exact", with: "LCD Soundsystem"
        
        click_on "Search (exact)"

        expect(page).to have_content(@lcd.name)
      end
    end
  end
end