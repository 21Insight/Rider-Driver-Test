class RiderController < ApplicationController
    def create_payment_method
      rider_id = params[:rider_id]
      card_token = params[:card_token]
  
      begin
        payment_service.create_payment_source(card_token, rider_id)
        # Enviar respuesta de éxito al cliente
        return { message: 'Payment method created', code: 200}
      rescue StandardError => e
        # Manejar errores y enviar respuesta de error al cliente
        return { message: 'Error creating payment method' , error: e.message , code: 500}
      end
    end
  
    def request_ride
      rider_id = params[:rider_id]
      current_location = params[:current_location]
  
      begin
        ride_service.request_ride(rider_id, current_location)
        # Enviar respuesta de éxito al cliente
        return { message: 'Ride requested' , code: 200}
      rescue StandardError => e
        # Manejar errores y enviar respuesta de error al cliente
        return { message: 'Error requesting ride' , error: e.message , code: 500}
      end
    end
  
    private
  
    def payment_service
      @payment_service ||= PaymentService.new
    end
  
    def ride_service
      @ride_service ||= RideService.new
    end
end
  