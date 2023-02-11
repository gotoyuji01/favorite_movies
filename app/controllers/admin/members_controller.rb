class Admin::MembersController < ApplicationController
 # ログインしていないと表示できない  
  before_action :authenticate_admin!
  
  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
    @reviews = @member.reviews.all
  end
  
  def update
    @member = Member.find(params[:id])
  # ステータスを更新させる  
    if @member.is_deleted == false
      @member.update(is_deleted: true)
      redirect_to admin_member_path(@member)
    else
      @member.update(is_deleted: false)
      redirect_to admin_member_path(@member)
    end
  end
  
  private

  def member_params
    params.require(:member).permit(:name, :email, :is_deleted)
  end
  
  
end
