class ItemsController < ApplicationController
  before_action :authenticate_user! ,except: [:index,:show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  
  def index
    @products = Product.order("created_at DESC")
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

  def show
  end

  def edit
    if @product.user_id != current_user.id
      redirect_to root_path
    end
  end
  
  def update
    if @product.update(product_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @product.user_id == current_user.id
       @product.destroy
       redirect_to root_path
    end
  end
  

  private

  def product_params
    params.require(:product).permit(:product_name, :description, :category_id, :state_id, :delivery_charge_burden_id, :regional_original_delivery_id, :days_up_to_delivery_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
