class HomeController < ApplicationController
  def index
    if params[:module]
      @fkr_module = params[:module]
      @fkr_method = params[:method]
      @random = "Faker::#{@fkr_module}".constantize.send(@fkr_method)
    end
  end
  
  def methods
    
  end
end
