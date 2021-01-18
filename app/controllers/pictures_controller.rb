class PicturesController < ApplicationController
  before_action :move_to_index, except: [:index, :new, :show, :search]
  before_action :authenticate_user!, only: :new

  def index
    @pictures = Picture.includes(:user).order('created_at DESC')
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.valid?
      @picture.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def destroy
    picture = Picture.find(params[:id])
    if current_user.id == picture.user.id
      picture.destroy
      redirect_to action: :index
    else
      redirect_to action: :index
    end
  end

  def show
    @picture = Picture.find(params[:id])
    @comment = Comment.new
    @comments = @picture.comments.includes(:user).order('created_at DESC')
  end

  def edit
    @picture = Picture.find(params[:id])
    if current_user.id != @picture.user.id
      redirect_to action: :index
    end
  end

  def update
    @picture = Picture.find(params[:id])
    if @picture.update(picture_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def search
    @pictures = Picture.search(params[:keyword]).order('created_at DESC')
  end

  def bizarre
    @pictures = Picture.where(genre_id: 1)
  end

  def alien
    @pictures = Picture.where(genre_id: 2)
  end

  def uma
    @pictures = Picture.where(genre_id: 3)
  end

  def myth
    @pictures = Picture.where(genre_id: 4)
  end

  def ruin
    @pictures = Picture.where(genre_id: 5)
  end
  
  private
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def picture_params
    params.require(:picture).permit(:image, :genre_id, :title, :text).merge(user_id: current_user.id)
  end
end
