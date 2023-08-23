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
      touring: params[:touring] == "on"
    })

    artist.save

    redirect_to '/artists'
  end

  def show
    @artist = Artist.find(params[:id])
  end
end