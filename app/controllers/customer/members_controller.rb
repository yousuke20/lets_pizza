class Customer::MembersController < ApplicationController
  before_action :authenticate_member!

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(update_params)
      flash[:success] = "ユーザー情報を更新しました！"
      redirect_to member_path(current_member)
    else
      flash[:danger] = "記載内容に誤りがあります！"
      render :edit
    end
  end

  def confirm
  end

  # ユーザーの退会処理
  def withdrawal
    # withdrawal_statusをfalseにし、「退会」ステータスに変更する
    current_member.update(withdrawal_status: "退会")

    # ログアウトし、session内のデータをリセットする
    reset_session
    flash[:success] = "退会処理が完了しました。"
    redirect_to root_path
  end

  # ユーザー情報のストロングパラメータ
  private

  def update_params
    params.require(:member).permit(:full_name, :full_name_kana, :email, :encrypted_password)
  end
end
