class AlbumsController < ApplicationController
  
  def index
    @albums = Album.all

    if params[:partial] != nil
      @albums = @albums.where("title like ?", "%#{params[:partial]}%")
    elsif params[:exact] != nil
      @albums = @albums.where(title: params[:exact])
    end
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
      number_of_songs: params[:number_of_songs],
      year_released: params[:year_released],
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