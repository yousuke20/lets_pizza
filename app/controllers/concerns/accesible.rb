module Accessible
  extend ActiveSupport::Concern
  included do
    before_action :check_user
  end

  protected

  def check_user
    if current_admin
      flash.clear
      # if you have rails_admin. You can redirect anywhere really
      redirect_to(admin_root_url) && return
    elsif current_member
      flash.clear
      # The authenticated root path can be defined in your routes.rb in: devise_for :customer do...
      redirect_to(root_path) && return
    end
  end
end
