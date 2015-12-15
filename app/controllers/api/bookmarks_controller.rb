module API
  class BookmarksController < ApplicationController
    before_action :authenticate_user!
    skip_before_filter  :verify_authenticity_token, except: [:index]

    def index
      render json: current_user.bookmarks.includes(:place)
    end

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
