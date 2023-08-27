class Artist < ApplicationRecord
  has_many :albums

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