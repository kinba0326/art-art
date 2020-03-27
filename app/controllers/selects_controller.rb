class SelectsController < ApplicationController
  def index 
    @selects = Select.all 
  end
end
