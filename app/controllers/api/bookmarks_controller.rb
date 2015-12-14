module API
  class BookmarksController < ApplicationController
    before_action :authenticate_user!

    def index
      render json: current_user.bookmarks
    end

    # def show
    #   render json: current_user.bookmark.find(params[:id])
    # end

    def create
      bookmark = current_user.bookmarks.new(bookmark_params)

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
      params.require(:bookmark).permit(:list, :comment, :place_id)
    end

  end
end
