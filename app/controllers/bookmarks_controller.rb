class BookmarksController < ApplicationController
  def index
    @list = List.new
    @lists = List.order(created_at: 'DESC')
    @bookmark = Bookmark.new
    @list_id = List.find(params[:list_id])
    @bookmarks = @list_id.bookmarks.order(created_at: 'DESC')
  end

  def create
    @list = List.find(params[:list_id])
    bookmark = @list.bookmarks.new(bookmark_params)
    bookmark.save
    render json:{ bookmark: bookmark }
  end

  def edit
    @list_id = List.find(params[:list_id])
    @lists = List.order(created_at: 'DESC')
    @bookmark = Bookmark.find(params[:id])
  end

  private

  def bookmark_params
    @list_id = List.find(params[:list_id])
    params.require(:bookmark).permit(:title, :bookmark_url, :text).merge(user_id: current_user.id)
  end

end
