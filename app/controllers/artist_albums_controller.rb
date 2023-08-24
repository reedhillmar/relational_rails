class ArtistAlbumsController < ApplicationController
  
  def index
    @artist = Artist.find(params[:artist_id])
    @albums = @artist.albums
  end
end