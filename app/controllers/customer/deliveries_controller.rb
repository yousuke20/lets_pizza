class Customer::DeliveriesController < ApplicationController
  before_action :authenticate_member!

  def index
    @deliveries = Delivery.where(member_id: current_member.id)
  end

  def create
    @delivery = Delivery.new(delivery_create_params)
    @delivery.member_id = current_member.id
    if @delivery.save
      flash[:success] = "新規配達先情報を登録しました！"
      redirect_to deliveries_path
    else
      flash[:danger] = "記載内容に誤りがあります！"
      render :index
    end
  end

  def edit
    @delivery = Delivery.find(params[:id])
  end

  def update
    @delivery = Delivery.find(params[:id])
    if @delivery.update(delivery_params)
      flash[:success] = "配達先情報を編集しました！"
      redirect_to deliveries_path
    else
      flash[:danger] = "記載内容に誤りがあります！"
      render :edit
    end
  end

  def destroy
    @delivery = Delivery.find(params[:id])
    @delivery.destroy
    flash[:success] = "配達先情報を削除しました！"
    redirect_to deliveries_path
  end

  # 配達先情報のストロングパラメータ
  private

  def delivery_create_params
    params.permit(:name, :postal_code, :address, :telephone_number, :member_id)
  end

  def delivery_params
    params.require(:delivery).permit(:name, :postal_code, :address, :telephone_number)
  end
end
