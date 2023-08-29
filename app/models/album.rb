class Album < ApplicationRecord
  belongs_to :artist

  validates_presence_of :title
  validates_presence_of :year_released
  validates_presence_of :number_of_songs
  validates :ep, inclusion: [true, false]

  def ep?
    if ep == true
      "EP"
    elsif ep == false
      "LP"
    end
  end

  def ep_checked?
    "checked" if ep == true
  end
  
end