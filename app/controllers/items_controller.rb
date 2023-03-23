class ItemsController < ApplicationController
  def index
    
  end

  def new
    @product = Product.new
  end

  def create
    Product.create(product_params)
  end

  private
  def product_params
    params.require(:product).permit(:'#', :'#', :image).merge('#': current_user.id)
  end
  
end
