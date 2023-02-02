class Public::MembersController < ApplicationController
  
  def show
    @member = current_member
    @reviews = @member.reviews.all
    
  end
  
  private
  
  def movie_params
    params.require(:member).permit(:name, :email)
  end
  
  
end
