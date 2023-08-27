class ArtistAlbumsController < ApplicationController
  
  def index
    @artist = Artist.find(params[:artist_id])
    @albums = @artist.albums

    if params[:sort] == "title"
      @albums = @albums.order(:title)
    end
  end

  def new
    @artist = Artist.find(params[:artist_id])
  end

  def create
    @artist = Artist.find(params[:artist_id])
    album = @artist.albums.new({
      title: params[:title],
      number_of_songs: params[:number_of_songs].to_i,
      year_released: params[:year_released].to_i,
      ep: params[:ep] == "on"
    })

    album.save

    redirect_to "/artists/#{@artist.id}/albums"
  end
end