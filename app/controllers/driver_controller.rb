class DriverController < ApplicationController
    def finish_ride
      ride_id = params[:ride_id]
      final_location = params[:final_location]
  
      begin
        total_amount = ride_service.finish_ride(ride_id, final_location)
        # Crear transacción usando Wompi API para cobrar al rider
        wompi_service.charge_rider(total_amount)
        # Enviar respuesta de éxito al cliente
        return { message: 'Ride finished', total_amount: total_amount, wompi_response: 'Success', code: 200 }
      rescue StandardError => e
        # Manejar errores y enviar respuesta de error al cliente
        return { message: 'Error finishing ride', error: e.message, code: 500 }
      end
    end
  
    private
  
    def ride_service
      @ride_service ||= RideService.new
    end
  
    def wompi_service
      @wompi_service ||= WompiService.new
    end
end
  