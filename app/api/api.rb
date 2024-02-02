require 'grape'

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
