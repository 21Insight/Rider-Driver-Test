require 'httparty'

class WompiService
  include HTTParty
  base_uri 'https://sandbox.wompi.co/v1'

  def self.create_transaction(user_id, amount, description)
    response = post(
      '/transactions',
      headers: {
        'Authorization' => "Bearer #{ENV['WOMPI_PRIVATE_KEY']}",
        'Content-Type' => 'application/json',
      },
      body: {
        amount_in_cents: amount * 100,
        currency: 'COP',
        customer_email: 'user@example.com', # Obtén el correo del usuario desde tu base de datos
        payment_method: {
          type: 'CARD',
          installments: 1,
        },
        reference: description,
        customer_id: user_id,
      }.to_json
    )

    handle_wompi_response(response)
  end

  private

  def self.handle_wompi_response(response)
    if response.success?
      # La transacción fue exitosa, puedes realizar acciones adicionales aquí
      return { success: true, transaction_id: response['id'] }
    else
      # Manejar errores de Wompi, por ejemplo, tarjeta inválida, fondos insuficientes, etc.
      return { success: false, error: response['error'] }
    end
  end
end
