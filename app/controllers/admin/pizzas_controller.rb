class Admin::PizzasController < ApplicationController
  before_action :authenticate_admin!

  def index
    @pizzas = Pizza.all.order(created_at: :desc)
  end

  def new
    @pizza = Pizza.new
  end

  def create
    @pizza = Pizza.new(pizza_params)
    if @pizza.save
      flash[:success] = "商品データを保存しました！"
      redirect_to admin_pizzas_path
    else
      flash[:danger] = "記載内容に誤りがあります！"
      render :new
    end
  end

  def show
    @pizza = Pizza.find(params[:id])
  end

  def edit
    @pizza = Pizza.find(params[:id])
  end

  def update
    @pizza = Pizza.find(params[:id])
    if @pizza.update(pizza_params)
      flash[:success] = "編集内容を保存しました！"
      redirect_to admin_pizza_path(@pizza)
    else
      flash[:danger] = "編集内容に誤りがあります！"
      redirect_to edit_admin_pizza_path(@pizza)
    end
  end

#ピザ商品データのストロングパラメータ設定
  private

  def pizza_params
    params.require(:pizza).permit(:image, :pizza_name, :price, :pizza_size, :sales_status)
  end
end
