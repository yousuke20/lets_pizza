Rails.application.routes.draw do
  
# 顧客側画面・処理のルーティング 
  devise_for :members, controllers: {
    sessions: 'customer/sessions',
    passwords: 'customer/passwords',
    registrations: 'customer/registrations'
  }
  
# <------------------------------------------>
  
# 管理者側画面・処理のルーティング
  devise_for :admins, path: 'admin',
  controllers: {
    sessions: 'admin/sessions',
    passwords: 'admin/passwords',
    registrations: 'admin/registrations'
  }
  
  namespace :admin do
    root to: 'homes#top'
    resources :pizzas, except: [:destroy]
    resources :members, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_pizzas, only: [:update]
  end  
# <------------------------------------------>
  
end
