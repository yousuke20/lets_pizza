class ApplicationController < ActionController::Base
  add_flash_types = :success, :info, :warning, :danger
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  # ログアウト後のパス設定
  def after_sign_out_path_for(resource)
    if resource == :admin
      new_admin_session_path
    elsif resource == :member
      root_path
    end
  end

  # ログイン後のパス設定
  def after_sign_in_path_for(resource)
    if resource.class == Admin
      admin_root_path
    elsif resource.class == Member
      pizzas_path
    end
  end

  # 顧客新規登録データのストロングパラメータ
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [
                                        :full_name,
                                        :full_name_kana,
                                        :withdrawal_status,
                                      ])

    devise_parameter_sanitizer.permit(:account_update,
                                      keys: [
                                        :full_name,
                                        :full_name_kana,
                                      ])
  end
end
