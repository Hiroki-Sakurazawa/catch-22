class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @pictures = current_user.pictures
  end
end
