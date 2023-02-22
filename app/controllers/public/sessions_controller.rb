# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  
  # サインイン後はマイページへ移動
  def after_sign_in_path_for(resource)
    members_my_page_path
  end
  
  # ゲストログイン
  def new_guest
    member = Member.guest
    sign_in member # ユーザーをログインさせる
    redirect_to movies_path, notice: 'ゲストメンバー(閲覧のみ)としてログインしました。'
  end
  
  protected

  # 会員の論理削除のための記述。退会後は、同じアカウントでは利用できない。
  def member_state
    @member = Member.find_by(email: params[:member][:email])
    return if !@member 
      if @member.valid_password?(params[:member][:password]) && (@member.is_deleted == true)
        flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
        redirect_to new_member_registration
      else
        flash[:notice] = "項目を入力してください"
      end
  end
  
end
