class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
    @order_pizza = @order.order_pizzas
  end
  
  def update
    @order = Order.find(params[:id])
    @order_pizza = @order.order_pizzas
    @order.update(order_params)
    
    # 注文ステータスを「入金確認」にすると、調理ステータスが「調理中」に更新される処理
    if @order.order_status == "入金確認"
      @order_pizza.update_all(cooking_status: "調理中")
      flash[:success] = "注文ステータスを「入金確認」に、調理ステータスを「調理中」に変更しました！"
      redirect_to admin_order_path(@order)
    # 注文ステータスを「入金待ち」にすると、調理ステータスが「調理不可」に更新される処理
    elsif @order.order_status == "入金待ち"
      @order_pizza.update_all(cooking_status: "調理不可")
      flash[:success] = "注文ステータスを「入金待ち」に、調理ステータスを「調理不可」に変更しました！"
      redirect_to admin_order_path(@order)
    # 注文ステータスを上記の2項目以外にした場合 
    else
      flash[:success] = "注文ステータスを更新しました！"
      redirect_to admin_order_path(@order)
    end
  end
  
# 注文データのストロングパラメータ設定 
  private
  
  def order_params
    params.require(:order).permit(:order_status)
  end
  
end
