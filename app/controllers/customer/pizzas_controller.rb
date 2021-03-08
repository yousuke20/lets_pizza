class Customer::PizzasController < ApplicationController
  
  def index
    @pizzas = Pizza.all.order(created_at: :desc)
  end
  
  def show
    @pizza = Pizza.find(params[:id])
    @cart_item = CartItem.new
  end
  
end
