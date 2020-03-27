class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @arts = user.arts.page(params[:page]).per(9).order("created_at DESC")
  end
end
