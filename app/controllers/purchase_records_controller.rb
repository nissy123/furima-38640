class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_purchase_record, only: [:index, :create]

  def index
    @product = Product.find(params[:item_id])
    @purchase_record_form = PurchaseRecordForm.new
  end

  def create
    @product = Product.find(params[:item_id])
    @purchase_record_form = PurchaseRecordForm.new(purchase_records_params)
    if @purchase_record_form.valid?
      pay_item
      @purchase_record_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_records_params
    params.require(:purchase_record_form).permit(:prefecture_id, :postal_code, :city, :block, :buildings_name, :phone_number).merge(user_id: current_user.id, product_id: params[:item_id], token: params[:token])
  end
  
  def set_purchase_record
    @product = Product.find(params[:item_id])
    if @product.user_id == current_user || @product.purchase_record != nil
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @product.price,  # 商品の値段
      card: purchase_records_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
