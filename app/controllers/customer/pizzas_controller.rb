class Customer::PizzasController < ApplicationController
  
  def index
    @pizzas = Pizza.all.order(created_at: :desc)
  end
  
  def show
    
  end
end
