require 'rails_helper'

RSpec.describe Album, type: :model do
  describe "relationships" do
    it { should belong_to(:artist) }
  end

  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :year_released}
    it { should validate_presence_of :number_of_songs}
    it { should allow_value(true).for(:ep)}
    it { should allow_value(false).for(:ep)}
  end

  before :each do
    @lcd = Artist.create!(name: "LCD Soundsystem", year_formed: "2002", touring: false)
    @american_dream = @lcd.albums.create!(title: "American Dream", ep: false, number_of_songs: 11, year_released: 2017)
    @north_american = @lcd.albums.create!(title: "North American Scum EP", ep: true, number_of_songs: 3, year_released: 2007)
  end

  describe "#ep?" do
    it "can return EP or LP" do
      expect(@american_dream.ep?).to eq("LP")
      expect(@north_american.ep?).to eq("EP")
    end
  end

  describe "#ep_checked?" do
    it "can return checked or nil" do
      expect(@american_dream.ep_checked?).to eq(nil)
      expect(@north_american.ep_checked?).to eq("checked")
    end
  end
end