class ListsController < ApplicationController

  def show
    list = List.find(params[:id])
    render json: {list: list.name, items: list.items }, status: 201
  end

  def index
    lists = List.all
    name_list = lists.map { |list| list.name }
    render json: {name: name_list}, status: 201
  end

  def create
    list = List.new(list_params)
    if list.save
      render json: list.to_json
    else
      render json: { message: "Invalid Input" }, status: 422
    end
  end

  def update
    list = List.find(params[:id])
    list.update_attributes(list_params)
    if list.save
      render json: list.to_json
    else
      render json: { message: "Invalid Input" }, status: 422
    end
  end

  def destroy
    list = List.find(params[:id])
    if list.destroy
      render json: { message: "List Deleted"}
    else
      render json: { message: "List does not exist" }, status: 404
    end

  end


  private

  def list_params
    params.require(:list).permit(:name, :user_id)
  end

end
