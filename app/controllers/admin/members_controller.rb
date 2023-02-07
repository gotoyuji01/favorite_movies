class Admin::MembersController < ApplicationController
  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
    @reviews = @member.reviews.all
  end
  
  
  
end
