require 'httparty'

class RiderService
    def create_payment_source(token, user_id)
    response = HTTParty.post(
        'https://sandbox.wompi.co/v1/payment_sources',
        headers: {
        'Authorization' => "Bearer YOUR_WOMPI_PRIVATE_KEY",
        'Content-Type' => 'application/json',
        },
        body: {
        type: 'CARD',
        token: token,
        customer_id: user_id,
        }.to_json
    )
    return response.parsed_response
    end
end
