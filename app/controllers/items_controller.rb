class ItemsController < ApplicationController

  def show
    item = Item.find(params[:id])
    render json: {item: item.name, items: item.items }, status: 201
  end

  def index
    items = Item.all
    items_content = []
    items.each do |item|
      items_content << item.name
    end
    render json: { items: items_content }, status: 201
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
      render json: { message: "item Deleted"}
    else
      render json: { message: "item does not exist" }, status: 404
    end

  end


  private

  def item_params
    params.require(:item).permit(:name, :list_id)
  end

end


