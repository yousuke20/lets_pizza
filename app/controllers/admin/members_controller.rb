class Admin::MembersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @members = Member.all.order(created_at: :desc)
    @members = Member.page(params[:page]).per(9)
  end

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      flash[:success] = "会員情報を変更しました！"
      redirect_to admin_member_path(@member)
    else
      flash[:danger] = "編集内容に不備があります！"
      render :edit
    end
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    flash[:success] = "選択した顧客情報を削除しました！"
    redirect_to admin_members_path
  end

  # 顧客データのストロングパラメータ設定
  private

  def member_params
    params.require(:member).permit(:full_name, :full_name_kana, :email, :withdrawal_status)
  end
end
