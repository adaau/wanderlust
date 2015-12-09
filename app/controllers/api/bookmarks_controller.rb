module API
  class BookmarksController < ApplicationController

    def index
      render json: Bookmark.all
    end

    def show
      render json: Bookmark.find(params[:id])
    end

    def create
      bookmark = Bookmark.new(bookmark_params)

      if bookmark.save
        render json: bookmark, status: 201, location: [:api, bookmark]
      else
        render json: bookmark.errors, status: 422
      end
    end

    def destroy
      bookmark = Bookmark.find(params[:id])
      bookmark.destroy
      head 204
    end

    private
    def bookmark_params
      params.require(:bookmark).permit(:list, :comment)
    end

  end
end