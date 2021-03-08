class Customer::OrdersController < ApplicationController
  before_action :authenticate_member!
  
  # 注文情報入力画面
  def new
    @order = Order.new
  end
  
  # 注文情報ページで入力した支払方法、配達先データを、sessionで保持
  def confirm
    @order = current_member.orders
    
    session[:payment_method] = params[:payment_method]
    if params[:add] = "new_address"
      session[:delivery_postal_code] = params[:delivery_postal_code]
      session[:delivery_address] = params[:delivery_address]
      session[:delivery_name] = params[:delivery_name]
    elsif params[:add] = "my_address"
      session[:delivery_address] = params[:delivery]
    else
      render :new
    end
  end
  
  # 注文情報の保存
  def create
    
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
  
  def calculate(member)
    total_price = 0
    member.cart_items.each do |cart_item|
      total_price += cart_item.number_of_sheets * cart_item.pizza.price
    end
    return (total_price * 1.1).floor
  end
end
