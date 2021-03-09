class Customer::OrdersController < ApplicationController
  before_action :authenticate_member!
  
  # 注文情報入力画面
  def new
    @order = Order.new
  end
  
  # 注文確認画面
  def confirm
    
    @order = current_member.orders
    @total_price = calculate(current_member)
    
    session[:payment_method] = params[:payment_method]
    
    if params[:delivery] == "new_address"
      session[:postal_code] = params[:session][:postal_code]
      session[:address] = params[:session][:address]
      session[:name] = params[:session][:name]
      session[:telephone_number] = params[:session][:telephone_number]
    elsif params[:delivery] == "my_address"
      session[:postal_code] = params[:delivery_postal_code]
      session[:address] = params[:delivery_address]
      session[:name] = params[:delivery_name]
      session[:telephone_number] = params[:telephone_number]
    end  
  end
  
  def create
    
    # 顧客が入力した郵便番号・氏名・電話番号・住所を、Deliveryテーブルに保存
    @delivery = Delivery.new
    @delivery.member_id = current_member.id
    @delivery.payment_method = session[:payment_method]
    @delivery.name = session[:name]
    @delivery.postal_code = session[:postal_code]
    @delivery.address = session[:address]
    @delivery.telephone_number = session[:telephone_number]
    @delivery.save
    
    # 注文情報の保存
    @order = Order.new
    @order.member_id = current_member.id
    @order.delivery_id = @delivery.id
    @order.delivery_postal_code = session[:postal_code]
    @order.delivery_address = session[:address]
    @order.delivery_name = session[:name]
    @order.delivery_telephone_number = session[:telephone_number]
    @order.payment_method = session[:payment_method]
    @order.billing_amount = calculate(current_member)
    @order.order_status = 0
    @order.save
    
    # 注文商品ごとの詳細データの保存
    current_member.cart_items.each do |cart|
      @order_pizza = OrderPizza.new
      @order_pizza.order_id = @order.id
      @order_pizza.pizza_id = cart.pizza.id
      @order_pizza.price = cart.pizza.price
      @order_pizza.number_of_sheets = cart.number_of_sheets
      @order_pizza.cooking_status = 0
      @order_pizza.save
    end
    
    # 現在ユーザーのカート内データ、及び支払方法・お届け先データの削除
      current_member.cart_items.destroy_all
      session.delete(:payment_method)
      session.delete(:postal_code)
      session.delete(:address)
      session.delete(:name)
      session.delete(:telephone_number)
      flash[:success] = "注文が完了しました！"
      redirect_to orders_complete_path
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
  
  def confirm_params
    params.permit(:payment_method, :postal_code, :address, :name, :telephone_number)
  end
  
  def calculate(member)
    total_price = 0
    member.cart_items.each do |cart_item|
      total_price += cart_item.number_of_sheets * cart_item.pizza.price
    end
    return (total_price * 1.1).floor
  end
end
