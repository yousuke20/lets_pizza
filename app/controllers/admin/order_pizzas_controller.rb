class Admin::OrderPizzasController < ApplicationController
  before_action :authenticate_admin!
  
  def update
    @order_pizza = OrderPizza.find(params[:id])
    @order = @order_pizza.order
    @order_pizza.update(order_pizza_params)
    
  # 1つの調理ステータスを「調理完了」にすると、 注文ステータスが「配達準備中」に更新される処理
    if @order_pizza.cooking_status == "調理完了"
      @order.update(order_status: "配達準備中")
      flash[:success] = "調理ステータスを「調理完了」に、注文ステータスを「配達準備中」に変更しました！"
      redirect_to admin_order_path(@order_pizza.order.id)
  # 全ての調理ステータスを「調理完了」にすると、 注文ステータスが「配達準備完了」に更新される処理
    elsif @order.order_pizza.count == @order.order_pizza.where(cooking_status: "調理完了").count
      @order.update(order_status: "配達準備完了")
      flash[:success] = "全ての調理ステータスを「調理完了」に、注文ステータスを「配達準備完了」に変更しました！"
      redirect_to admin_order_path(@order_pizza.order.id)
  # 上記2つ以外の場合
    else
      flash[:success] = "調理ステータスを更新しました！"
      redirect_to admin_order_path(@order_pizza.order.id)
    end
  end
  
# 注文ピザデータのストロングパラメータ設定 
  private
  
  def order_pizza_params
    params.require(:order_pizza).permit(:cooking_status)
  end
  
end
