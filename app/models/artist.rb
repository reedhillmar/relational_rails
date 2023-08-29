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

  def self.order_by_album_count
    Artist.left_joins(:albums).group(:id).order("count(albums.id) desc")
  end

  def self.partial(keyword)
    Artist.where("name like ?", "%#{keyword}%")
  end

  def self.exact(keyword)
    Artist.where(name: keyword)
  end
end