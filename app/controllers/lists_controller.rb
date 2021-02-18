class ListsController < ApplicationController
  def index
    @list = List.new
    @lists = List.order(created_at: 'DESC')
  end

  def create
    @list = List.new(list_params)
    if @list.valid?
      @list.save
      redirect_to list_bookmarks_path(@list[:id])
    else
      @lists = List.order(created_at: 'desc')
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
      render list_bookmarks_path(@list.id)
    end
  end


  private

  def list_params
    params.require(:list).permit(:list_name).merge(user_id: current_user.id)
  end

end
