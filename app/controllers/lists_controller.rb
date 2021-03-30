class ListsController < ApplicationController

  def index
    @list = List.new
    @lists = List.order(created_at: 'DESC')
  end

  def create
    @list = List.new(list_params)
    if @list.valid?
      @list.save
      redirect_back(fallback_location: list_bookmarks_path(@list[:id]))
    else
      @list = List.new
      @lists = List.order(created_at: 'desc')
      flash.now[:alert] = 'リストの作成に失敗しました'
      render :index
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy if current_user.id == @list.user_id
    redirect_to root_path
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      redirect_to list_bookmarks_path(@list.id)
    else
      @list = List.new
      @lists = List.order(created_at: 'DESC')
      flash.now[:alert] = 'リストの編集に失敗しました'
      render :index
    end
  end


  private

  def list_params
    params.require(:list).permit(:list_name).merge(user_id: current_user.id)
  end

end
