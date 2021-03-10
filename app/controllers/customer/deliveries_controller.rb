class Customer::DeliveriesController < ApplicationController
  before_action :authenticate_member!
  
  def index
    @deliveries = Delivery.where(member_id: current_member.id)
    @delivery = Delivery.new
  end
  
  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.save
    flash[:success] = "新規配達先情報を登録しました！"
    redirect_to deliveries_path
  end
  
  def edit
    @delivery = Delivery.find(params[:id])
  end
  
  def update
    @delivery = Delivery.find(params[:id])
    @delivery.update(delivery_params)
    flash[:success] = "配達先情報を編集しました！"
    redirect_to deliveries_path
  end
  
  def destroy
    @delivery = Delivery.find(params[:id])
    @delivery.destroy
    flash[:success] = "配達先情報を削除しました！"
    redirect_to deliveries_path
  end
  
  #配達先情報のストロングパラメータ 
  private
  
  def delivery_params
    params.permit(:name, :postal_code, :address, :telephone_number)
  end
  
end
