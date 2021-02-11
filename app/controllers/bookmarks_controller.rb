class BookmarksController < ApplicationController
  def index
    @list = List.new
    @lists = List.order(created_at: 'DESC')
    @bookmark = Bookmark.new
    @list_id = List.find(params[:list_id])
  end

  def create
    bookmark = Bookmark.create(bookmark_params)
    render json:{ bookmark: bookmark }
  end

  private

  def bookmark_params
    @list_id = List.find(params[:list_id])
    params.require(:bookmark).permit(:title, :url, :text).merge(user_id: current_user.id, list_id: @list_id.id)
  end

end
