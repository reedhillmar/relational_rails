class AlbumsController < ApplicationController
  
  def index
    @albums = Album.all
  end

  def new

  end

  def create
    album = Album.new({
      title: params[:title],
      number_of_songs: params[:number_of_songs].to_i,
      year_released: params[:year_released].to_i,
      ep: params[:ep] == "on"
    })

    album.save

    redirect_to '/albums'
  end

  def show
    @album = Album.find(params[:id])
  end

  def find_artist_id(artist_name)
    Artists.all.each do |artist|
      artist.id if artist.name == artist_name
    end
  end
end