class AlbumsController < ApplicationController
  
  def index
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id])
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    album = Album.find(params[:id])
    album.update({
      title: params[:title],
      number_of_songs: params[:number_of_songs].to_i,
      year_released: params[:year_released].to_i,
      ep: params[:ep] != "0"
    })

    album.save

    redirect_to "/albums/#{album.id}"
  end

  def destroy
    Album.destroy(params[:id])
    redirect_to "/albums"
  end
end