class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    @product = Product.find(params[:item_id])
    @purchase_record_form = PurchaseRecordForm.new
  end

  def create
    @product = Product.find(params[:item_id])
    @purchase_record_form = PurchaseRecordForm.new(purchase_records_params)
    if @purchase_record_form.valid?
      @purchase_record_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_records_params
    params.require(:purchase_record_form).permit(:prefecture_id, :postal_code, :city, :block, :buildings_name, :phone_number).merge(user_id: current_user.id, product_id: params[:item_id])
  end
  
end
