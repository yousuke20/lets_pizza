class Customer::PizzasController < ApplicationController
  
  def index
    @pizzas = Pizza.all.order(created_at: :desc)
    @pizzas = Pizza.page(params[:page]).per(6)
  end
  
  def show
    @pizza = Pizza.find(params[:id])
    @cart_item = CartItem.new
  end
  
end
