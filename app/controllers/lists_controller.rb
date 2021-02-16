class ListsController < ApplicationController
  def index
    @list = List.new
    @lists = List.order(created_at: 'DESC')
  end

  def create
    list = List.create(list_params)
    render json:{ list: list }
  end

  def update
  end
  

  private

  def list_params
    params.require(:list).permit(:list_name).merge(user_id: current_user.id)
  end

end
