class Album < ApplicationRecord
  belongs_to :artist

  def ep?
    if ep == true
      "EP"
    elsif ep == false
      "LP"
    end
  end
  
end