class Customer::PizzasController < ApplicationController
  before_action :search_pizza, only: [:index, :search]

  def index
    @pizzas = Pizza.page(params[:page]).per(6).order(created_at: :desc)
  end

  def search
    @results = @search.result.page(params[:page]).per(6)
  end

  def show
    @pizza = Pizza.find(params[:id])
    @cart_item = CartItem.new
  end

  private

  # 検索オブジェクトの生成
  def search_pizza
    @search = Pizza.ransack(params[:q])
  end
end
