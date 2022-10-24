require 'rest-client'
require 'json'

# ApiIndicator class
class ApiIndicator
  attr_accessor :uri

  # Creates the object
  def initialize( uri = '' )
    @URI = uri
  end

  # Gets the root URI from the API and render it as json
  def get_data
    response = RestClient::Request.execute(url: @URI, method: :get, verify_ssl: false)

    JSON.parse(response.to_s)
  end
end

if __FILE__ == $0
  indicators = %w[uf ivp dolar dolar_intercambio euro ipc
                  utm imacec tpm libra_cobre tasa_desempleo bitcoin]

  puts '¿Qué indicador quieres consultar?'
  indicators.each_with_index do |value, index|
    puts "#{value}: (#{index})"
  end

  user_selection = gets.chomp.to_i

  url = "165.227.94.139/api/#{indicators[user_selection]}"

  indicator = ApiIndicator.new(url)

  indicator.get_data.each do |key, value|
    puts "#{key}: #{value}"
  end
end
