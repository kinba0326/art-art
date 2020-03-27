class SelectsController < ApplicationController
  def index
    @arts = Art.includes(:user).order("updated_at DESC").page(params[:page]).per(60)
  end
end
