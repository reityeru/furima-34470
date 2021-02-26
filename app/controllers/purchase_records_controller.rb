class PurchaseRecordsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase_record_shipping_information = PurchaseRecordShippingInformation.new
  end

  def create
    @purchase_record_shipping_information = PurchaseRecordShippingInformation.new(purchase_record_shipping_information_params)
    if @purchase_record_shipping_information.valid?
      @purchase_record_shipping_information.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end


  private

  def purchase_record_shipping_information_params
    params.require(:purchase_record_shipping_information).permit(:postal_code, :shipping_area_id, :municipality, :address, :building_name, :phone_number, :number, :exp_month, :exp_year, :cvc).merge(user_id: current_user.id,  item_id: params[:item_id])
  end
end
