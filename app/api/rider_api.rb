module MyRideHailingApp
  class RiderAPI < Grape::API
    resource :rider do
      desc 'Create a payment method for a rider'
      params do
        requires :rider_id, type: Integer
        requires :tokenized_card_info, type: String
      end
      post :payment do
        RiderService.create_payment_method(params[:rider_id], params[:tokenized_card_info])
      end

      desc 'Request a ride'
      params do
        requires :rider_id, type: Integer
        requires :location_data, type: Hash
      end
      post :ride do
        RiderService.request_ride(params[:rider_id], params[:location_data])
      end
    end
  end
end
