class ArtistAlbumsController < ApplicationController
  
  def index
    # require 'pry';binding.pry
    @artist = Artist.find(params[:id])
    @albums = @artist.albums

    if params[:sort] == "title"
      @albums = @albums.order(:title)
    elsif params[:threshold] != nil
      @albums = @albums.where("year_released >= #{params[:threshold]}")
    elsif params[:partial] != nil
      @albums = @albums.where("title like ?", "%#{params[:partial]}%")
    elsif params[:exact] != nil
      @albums = @albums.where(title: params[:exact])
    end
  end

  def new
    @artist = Artist.find(params[:id])
  end

  def create
    @artist = Artist.find(params[:id])
    album = @artist.albums.new({
      title: params[:title],
      number_of_songs: params[:number_of_songs],
      year_released: params[:year_released],
      ep: params[:ep] != "0"
    })

    album.save

    redirect_to "/artists/#{@artist.id}/albums"
  end
end