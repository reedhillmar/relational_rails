class Artist < ApplicationRecord
  has_many :albums, :dependent => :destroy

  validates_presence_of :name
  validates_presence_of :year_formed
  validates :touring, inclusion: [true, false]
  
  def touring?
    if touring == true
      "touring!"
    elsif touring == false
      "not touring :("
    end
  end

  def touring_checked?
    "checked" if touring == true
  end
end