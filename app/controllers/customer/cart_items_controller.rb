class Customer::CartItemsController < ApplicationController
  before_action :authenticate_member!

  def create
    @cart_item = CartItem.new(cart_item_params_create)
    @cart_item.member_id = current_member.id
    @cart_item.pizza_id = params[:pizza_id]
    @cart_item.save
    flash[:success] = '選択したピザをカートに入れました！'
    redirect_to cart_items_path
  end

  def index
    @cart_items = current_member.cart_items
    @total_price = calculate(current_member)
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item = CartItem.update(cart_item_params_update)
    flash[:success] = "ピザの枚数を変更しました！"
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    flash[:success] = "選択したピザをカートから削除しました！"
    redirect_to cart_items_path
  end

  def destroy_all
    current_member.cart_items.destroy_all
    flash[:success] = 'カート内商品を全て削除しました！'
    redirect_to cart_items_path
  end

  # カート内データのストロングパラメータ
  private

  # create用のストロングパラメータ
  def cart_item_params_create
    params.require(:cart_item).permit(:number_of_sheets, :pizza_id, :member_id)
  end

  # update用のストロングパラメータ
  def cart_item_params_update
    params.permit(:number_of_sheets, :pizza_id, :member_id)
  end

  # ショッピングカート合計金額の算出
  def calculate(member)
    total_price = 0
    member.cart_items.each do |cart_item|
      total_price += cart_item.number_of_sheets.to_i * cart_item.pizza.price
    end
    (total_price * 1.1).floor
  end
end
