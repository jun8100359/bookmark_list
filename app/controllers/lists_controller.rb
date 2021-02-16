class ListsController < ApplicationController
  def index
    @list = List.new
    @lists = List.order(created_at: 'DESC')
  end

  def create
    list = List.create(list_params)
    render json:{ list: list }
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy if current_user.id == @list.user_id
    redirect_to root_path
  end

  def update
  end


  private

  def list_params
    params.require(:list).permit(:list_name).merge(user_id: current_user.id)
  end

end
