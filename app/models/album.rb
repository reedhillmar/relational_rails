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
  
  def self.partial(keyword)
    Album.where("title like ?", "%#{keyword}%")
  end

  def self.exact(keyword)
    Album.where(title: keyword)
  end

  def self.order_by_title
    Album.order(:title)
  end

  def self.year_threshold(year)
    Album.where("year_released >= #{year}")
  end
end