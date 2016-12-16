class ListsController < ApplicationController

  def show
    list = List.find(params[:id])
    render json: {list: list.name, items: list.items }, status: 201
  end

  def index
    lists = List.all
    name_list = lists.map { |list| list.name  }
    render json: {lists: name_list}, status: 201
  end


end
