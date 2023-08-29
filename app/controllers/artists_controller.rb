class ArtistsController < ApplicationController
  
  def index
    @artists = Artist.all
  end

  def new

  end

  def create
    # require 'pry';binding.pry
    artist = Artist.new({
      name: params[:name],
      year_formed: params[:year_formed].to_i,
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
      year_formed: params[:year_formed].to_i,
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