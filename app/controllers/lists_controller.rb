class ListsController < ApplicationController

  def show
    @list = List.find(params[:id])
    if request.xhr?
      render json: {list: @list.name, items: @list.items }, status: 201
    end
  end

  def index
    list = List.last
    render json: {test: "hey" }, status: 201
  end


end
