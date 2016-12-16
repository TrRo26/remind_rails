class ItemsController < ApplicationController

  def show
    item = Item.find(params[:id])
    render json: {item: item.name, list_id: item.list_id}, status: 201
  end

  def index
    items = Item.all
    name_item = items.map { |item| { name: item.name, list_id: item.list_id }  }
    render json: {items: name_item}, status: 201
  end

  def create
    item = Item.new(item_params)
    if item.save
      render json: item.to_json
    else
      render json: { message: "Invalid Input" }, status: 422
    end
  end

  def update
    item = Item.find(params[:id])
    item.update_attributes(item_params)
    if item.save
      render json: item.to_json
    else
      render json: { message: "Invalid Input" }, status: 422
    end
  end

  def destroy
    item = Item.find(params[:id])
    if item.destroy
      render json: { message: "Item Deleted"}
    else
      render json: { message: "Item does not exist" }, status: 404
    end

  end

  private

  def item_params
    params.require(:item).permit(:name, :list_id)
  end

end
