class ArtsController < ApplicationController
  before_action :set_art, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show, :search]
  
  def index
    @arts = Art.includes(:user).order("created_at DESC").page(params[:page]).per(30)
  end

  def new
    @art = Art.new
  end

  def create
    Art.create(art_params)
  end
  
  def destroy
    art = Art.find(params[:id])
    art.destroy
  end
  
  def edit
  end

  def update
    art = Art.find(params[:id])
    art.update(art_params)
  end

  def show
    @comment = Comment.new
    @comments = @art.comments.includes(:user)
  end

  def search
    @arts = Art.search(params[:keyword])
  end

  private
  def art_params
    params.require(:art).permit(:image, :text).merge(user_id: current_user.id)
  end

  def set_art
    @art = Art.find(params[:id]) 
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
