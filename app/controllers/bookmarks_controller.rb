class BookmarksController < ApplicationController
  before_action :move_to_session
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
    if bookmark.valid?
      bookmark.save
      redirect_back(fallback_location: list_bookmarks_path(@list[:id]))
    else
      @list = List.new
      @lists = List.order(created_at: 'DESC')
      @bookmark = Bookmark.new
      @list_id = List.find(params[:list_id])
      @bookmarks = @list_id.bookmarks.order(created_at: 'DESC')
      flash.now[:alert] = 'ブックマークの作成に失敗しました'
      render :index
    end
  end

  def edit
    @list_id = List.find(params[:list_id])
    @lists = List.order(created_at: 'DESC')
    @bookmark = Bookmark.find(params[:id])
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.update(bookmark_params)
      redirect_to  "/lists/#{@bookmark.list_id}/bookmarks"
    else
      @list = List.new
      @lists = List.order(created_at: 'DESC')
      @bookmark = Bookmark.find(params[:id])
      flash.now[:alert] = 'ブックマークの編集に失敗しました'
      render :edit
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy if current_user.id == @bookmark.user_id
    redirect_to "/lists/#{@bookmark.list_id}/bookmarks"
  end

  private

  def bookmark_params
    @list_id = List.find(params[:list_id])
    params.require(:bookmark).permit(:title, :bookmark_url, :text).merge(user_id: current_user.id)
  end

  def move_to_session
    @list_id = List.find(params[:list_id])
    return redirect_to root_path if !(current_user.id == @list_id.user_id)
  end
end
