class HomeController < ApplicationController
  before_action :set_modules
  before_action :set_module

  def index
    if @fkr_module
      @fkr_method = params[:method]
      @random = "Faker::#{@fkr_module}".constantize.send(@fkr_method)
    end
  end

  def module_methods
    render json: modules_and_methods[@fkr_module.underscore.to_sym].to_json
  end

  private

  def set_modules
    @modules = modules_and_methods.keys.map(&:to_s).map(&:camelize)
  end

  def set_module
    return if params[:module].nil?
    module_name = params[:module].underscore
    return unless modules_and_methods.keys.include?(module_name.to_sym)
    @fkr_module = module_name.camelize
  end

  def modules_and_methods
    {
      address: [
        :city,
        :street_name,
        :street_address,
        :secondary_address
      ],
      chuck_norris: [
        :fact
      ],
      rock_band: [
        :name
      ]
    }
  end
end
