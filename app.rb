require 'grape'
require 'sequel'

Dir["./app/**/*.rb"].each { |f| require f }

module MyRideHailingApp
  class API < Grape::API
    # Configuración de Grape
  end
end
