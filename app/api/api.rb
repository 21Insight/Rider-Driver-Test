require 'grape'

require_relative 'rider_api'
require_relative 'driver_api'

module MyRideHailingApp
  class API < Grape::API
    format :json
    prefix 'api'

    # Rider Endpoints
    mount RiderAPI

    # Driver Endpoints
    mount DriverAPI
  end
end
