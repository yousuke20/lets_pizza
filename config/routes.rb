Rails.application.routes.draw do
  
# 顧客側画面・処理のルーティング 
  devise_for :members, controllers: {
    sessions: 'customer/sessions',
    passwords: 'customer/passwords',
    registrations: 'customer/registrations'
  }
  
  scope module: :customer do
    root to: 'homes#top'
    get '/about' => 'homes#about'
    get '/shop' => 'homes#shop'
    
    resources :pizzas, only: [:index, :show]
    
    resources :members, only: [:show, :edit, :update]
    get '/members/confirm' => 'members#confirm'           # 顧客の退会確認画面
    patch '/members/withdrawal' => 'members#withdrawal'   # 顧客の退会処理(会員ステータスの更新)
   
    resources :cart_items, only: [:index, :create, :update, :destroy]
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'    # カート内商品の全削除
    
    resources :orders, only: [:index, :new, :create, :show]
    post '/orders/confirm' => 'orders#confirm'      # 注文情報確認画面
    get 'orders/complete' => 'orders#complete'      # 注文完了画面
    
    resources :deliveries, only: [:index, :creare, :edit, :update, :destroy]
  end
  
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
    resources :pizzas
    resources :members, only: [:index, :show, :edit, :update, :destroy]
    resources :orders, only: [:show, :update]
    resources :order_pizzas, only: [:update]
  end  
# <------------------------------------------>
  
end
