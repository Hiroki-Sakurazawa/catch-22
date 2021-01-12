class PicturesController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @pictures = Picture.all.order('created_at DESC')
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
