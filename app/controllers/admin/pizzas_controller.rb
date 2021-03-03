class Admin::PizzasController < ApplicationController

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
    
  end
  
  def edit
    
  end
  
  def update
    
  end
  
#ピザ商品データのストロングパラメータ設定 
  private
  
  def pizza_params
    params.require(:pizza).permit(:image, :pizza_name, :price, :pizza_size, :sales_status)
  end
end
