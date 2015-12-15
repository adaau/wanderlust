module API
  class PlacesController < ApplicationController

    def index
      # need to sort
      @places = Place.includes(:months, :categories).limit(50).offset(50)
    end

    def show
      @place = Place.find(params[:id])
    end

  end
end