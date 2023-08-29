class ArtistsController < ApplicationController
  
  def index
    @artists = Artist.all

    if params[:sort] == "albums_count"
      @artists = @artists.left_joins(:albums).group(:id).order("count(albums.id) desc")
    elsif params[:partial] != nil
      @artists = @artists.where("name like ?", "%#{params[:partial]}%")
    elsif params[:exact] != nil
      @artists = @artists.where(name: params[:exact])
    end
  end

  def new

  end

  def create
    artist = Artist.new({
      name: params[:name],
      year_formed: params[:year_formed],
      touring: params[:touring] != "0"
    })

    artist.save

    redirect_to '/artists'
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    artist = Artist.find(params[:id])
    artist.update({
      name: params[:name],
      year_formed: params[:year_formed],
      touring: params[:touring] != "0"
    })

    artist.save

    redirect_to "/artists/#{artist.id}"
  end

  def destroy
    Artist.destroy(params[:id])
    redirect_to "/artists"
  end
end