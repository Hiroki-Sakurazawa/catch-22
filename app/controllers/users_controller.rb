class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @pictures = user.pictures.order('created_at DESC')
  end
end
