class BookmarksController < ApplicationController
  def index
    @list = List.new
    @lists = List.order(created_at: 'DESC')
    @bookmark = Bookmark.new
    @list_id = List.find(params[:list_id])
  end

  def create
  end

end
