module API
  class BookmarksController < ApplicationController
    before_action :authenticate_user!
    before_action :set_bookmark, only: [:destroy]
    skip_before_filter  :verify_authenticity_token, except: [:index]

    def index
      render json: current_user.bookmarks.order(:list_number)
    end

    def create
      bookmark = current_user.bookmarks.new(bookmark_params)

      if bookmark.save
        render json: bookmark, status: 201
      else
        render json: bookmark.errors, status: 422
      end
    end

    def destroy
      if @bookmark.destroy
        head 204
      else
        render json: bookmark.errors, status: 422
      end
    end

    private
    def set_bookmark
      @bookmark = Bookmark.find(params[:id])
      if @bookmark.nil?
        render json: {message: "Bookmark not found"}, status: 404
      end
    end

    def bookmark_params
      params.require(:bookmark).permit(:list, :comment, :place_id)
    end
  end
end
