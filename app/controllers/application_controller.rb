class ApplicationController < ActionController::Base
  add_flash_types = :success, :info, :warning, :danger
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  # ログアウト後のパス設定
  def after_sign_out_path_for(resource)
    if resource == :admin
      flash[:success] = 'ログアウトしました！'
      new_admin_session_path
    else
      flash[:success] = 'ログアウトしました！'
      root_path
    end
  end
  
# 顧客新規登録データのストロングパラメータ 
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
    keys: [
      :full_name, 
      :full_name_kana,
      :withdrawal_status
      ])
  end
end