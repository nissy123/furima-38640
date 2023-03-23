class ItemsController < ApplicationController
  def index
    
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:id, :product_name, :description, :category_id, :state_id, :delivery_charge_burden_id, :regional_original_delivery_id, :days_up_to_delivery_id, :price, :image).merge(user_id: current_user.id)
  end
  
end
