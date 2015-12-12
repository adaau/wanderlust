module API
  class PlacesController < ApplicationController

    def index
      render json: Place.all
    end

    def show
      render json: Place.find(params[:id])
    end

  end
end