module MyRideHailingApp
  class DriverAPI < Grape::API
    resource :driver do
      desc 'Finish a ride'
      params do
        requires :ride_id, type: Integer
        requires :final_location, type: Hash
      end
      post 'ride/finish' do
        DriverService.finish_ride(params[:ride_id], params[:final_location])
      end
    end
  end
end
