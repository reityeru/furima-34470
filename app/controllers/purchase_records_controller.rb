class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_root, only: [:index]

  def index
    @purchase_record_shipping_information = PurchaseRecordShippingInformation.new
  end

  def create
    @purchase_record_shipping_information = PurchaseRecordShippingInformation.new(purchase_record_shipping_information_params)
    if @purchase_record_shipping_information.valid?
      pay_item
      @purchase_record_shipping_information.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_record_shipping_information_params
    params.require(:purchase_record_shipping_information).permit(:postal_code, :shipping_area_id, :municipality, :address, :building_name, :phone_number, :number, :exp_month, :exp_year, :cvc).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.item_price,
      card: purchase_record_shipping_information_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_root
    set_item
    if @item.purchase_record.present? || current_user.id == @item.user_id
      redirect_to root_path 
    end
  end

end
