class PicturesController < ApplicationController
  before_action :move_to_index, except: [:index, :new]

  def index
    @pictures = Picture.all.order('created_at DESC')
  end

  def new
    @picture = Picture.new
  end

  def create
    Picture.create(picture_params)
  end
  
  private
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def picture_params
    params.require(:picture).permit(:image, :title, :text).merge(user_id: current_user.id)
  end
end
