class Customer::OrdersController < ApplicationController
  before_action :authenticate_member!

  # 注文情報入力画面
  def new
    @order = Order.new
    @deliveries = Delivery.where(member_id: current_member.id)
  end

  # 注文情報入力画面で入力した内容をsessionで一時保存
  def confirm
    @order = current_member.orders
    @total_price = calculate(current_member)

    session[:payment_method] = params[:payment_method]

    # 「本サイトのご利用が初めての方」を選択した場合の処理
    if params[:delivery] == "new_address"
      session[:postal_code] = params[:session][:postal_code]
      session[:address] = params[:session][:address]
      session[:name] = params[:session][:name]
      session[:telephone_number] = params[:session][:telephone_number]

    # 「マイページにて配達先の登録が完了している方」を選択した場合の処理
    elsif params[:delivery] == "my_address"
      session[:postal_code] =  params[:session][:delivery_postal_code]
      session[:address] = params[:session][:delivery_address]
      session[:name] = params[:session][:delivery_name]
      session[:telephone_number] = params[:session][:delivery_telephone_number]
    end

    # 郵便番号、住所、宛名、電話番号のいずれかが入力されていない場合の処理
    if session[:postal_code] == ""
      flash[:danger] = "郵便番号を入力してください！"
      redirect_to new_order_path
    elsif session[:address] == ""
      flash[:danger] = "配達先住所を入力してください！"
      redirect_to new_order_path
    elsif session[:name] == ""
      flash[:danger] = "宛名を入力してください！"
      redirect_to new_order_path
    elsif session[:telephone_number] == ""
      flash[:danger] = "電話番号を入力してください！"
      redirect_to new_order_path  
    end
  end

  def create
    # 注文情報の保存
    @order = Order.new
    @order.member_id = current_member.id
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
    @orders = Order.where(member_id: current_member.id).order(created_at: :desc)
  end

  def show
    @order = Order.find(params[:id])
    @order_pizzas = @order.order_pizzas
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
    (total_price * 1.1).floor
  end
end
