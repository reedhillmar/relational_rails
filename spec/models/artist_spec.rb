require 'rails_helper'

RSpec.describe Artist, type: :model do
  describe "relationships" do
    it { should have_many(:albums) }
  end

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :year_formed}
    it { should allow_value(true).for(:touring)}
    it { should allow_value(false).for(:touring)}
  end

  before :each do
    @lcd = Artist.create!(name: "LCD Soundsystem", year_formed: "2002", touring: false)
    @pup = Artist.create!(name: "PUP", year_formed: "2010", touring: true)
  end

  describe "#touring?" do
    it "can return touring or not touring" do
      expect(@lcd.touring?).to eq("not touring :(")
      expect(@pup.touring?).to eq("touring!")
    end
  end

  describe "#touring_checked?" do
    it "can return checked or nil" do
      expect(@lcd.touring_checked?).to eq(nil)
      expect(@pup.touring_checked?).to eq("checked")
    end
  end
end