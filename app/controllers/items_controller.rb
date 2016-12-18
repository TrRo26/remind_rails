class ItemsController < ApplicationController

  def create
    @item.create(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:list_id, :name)
  end
end
