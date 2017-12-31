class HomeController < ApplicationController
  before_action :set_modules
  before_action :set_module
  before_action :set_method, only: :index
  before_action :set_methods

  def index
    @random = "Faker::#{@fkr_module}".constantize.send(@fkr_method)
  end

  def module_methods
    render json: @methods.to_json
  end

  private

  def set_methods
    @methods = modules_and_methods[@fkr_module.underscore.to_sym]
  end

  def set_method
    @fkr_method = params[:method] || 'city'
  end

  def set_modules
    @modules = modules_and_methods.keys.map(&:to_s).map(&:camelize)
  end

  def set_module
    module_name = (params[:module] || 'Address').underscore
    return unless modules_and_methods.keys.include?(module_name.to_sym)
    @fkr_module = module_name.camelize
  end

  def modules_and_methods
    {
      address: [
        :city,
        :street_name,
        :street_address,
        :secondary_address,
        :building_number,
        :community,
        :zip_code,
        :zip,
        :postcode,
        :time_zone,
        :street_suffix,
        :city_suffix,
        :city_prefix,
        :state,
        :state_abbr,
        :country,
        :country_code,
        :country_code_long,
        :latitude,
        :longitude,
      ],
      ancient: [
        :god,
        :primordial,
        :titan,
        :hero
      ],
      app: [
        :name,
        :version,
        :author,
        :semantic_version,
      ],
      aqua_teen_hunger_force: [
        :character,
      ],
      back_to_the_future: [
        :character,
        :date,
        :quote,
      ],
      bank: [
        :name,
        :swift_bic,
        :iban,
      ],
      cat: [
        :name,
        :breed,
        :registry,
      ],
      chuck_norris: [
        :fact,
      ],
      rock_band: [
        :name,
      ]
    }
  end
end
