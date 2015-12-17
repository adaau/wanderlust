module API
  class PlacesController < ApplicationController

    def index
      # need to sort
      @places = Place.includes(:months, :categories)
    end

    def show
      @place = Place.find(params[:id])
    end

    def random
      place = Place.find(params[:place_id])
      @places = Place.where(continent:place.continent).where.not(photo_main:nil).limit(5).order("RANDOM()")
      render 'index.jbuilder'
    end

  end
end