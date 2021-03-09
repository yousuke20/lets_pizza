class Customer::OrdersController < ApplicationController
  before_action :authenticate_member!
  
  # 注文情報入力画面
  def new
    @order = Order.new
  end
  
  # 注文情報入力画面 支払方法及び配達先の入力処理
  def create_delivery
    @delivery = Delivery.new(create_delivery_params)
    @delivery.member_id = current_member.id
    if @delivery.save
      flash[:success] = "配達情報をセーブしました！"
      redirect_to orders_confirm_path
    end
  end
  
  # 注文確認画面
  def confirm
    @order = current_member.orders
    @delivery_person = Delivery.find_by(member_id: current_member.id)
    @total_price = calculate(current_member)
  end
  
  # 注文情報の保存
  def create
    @order = Order.new
  end
  
  # 注文完了画面
  def complete
    
  end
  
  def index
    
  end
  
  def show
  
  end
  
  # 注文データのストロングパラメータ
  private
  
  def create_delivery_params
    params.permit(:member_id, :name, :postal_code, :address, :telephone_number, :payment_method)
  end
  
  def calculate(member)
    total_price = 0
    member.cart_items.each do |cart_item|
      total_price += cart_item.number_of_sheets * cart_item.pizza.price
    end
    return (total_price * 1.1).floor
  end
end
