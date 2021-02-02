class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @user_name = user.user_name
    @pictures = user.pictures.order('created_at DESC')
  end
end
