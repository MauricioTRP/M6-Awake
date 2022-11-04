require 'rest-client'
require 'json'

# Primeras diez regiones

urlRegiones = "https://apis.digital.gob.cl/dpa/regiones?limit=10"

responseRegiones = RestClient.get urlRegiones
resultRegiones = JSON.parse(responseRegiones.to_s)
puts "Las regiones de norte a sur son:"
resultRegiones.each_with_index{|region, index| puts "        #{index+1}.- #{region["nombre"]}, actualmente la región #{region["codigo"]}" }

# 20 comunas orden descendente

urlComunas = "https://apis.digital.gob.cl/dpa/comunas?limit=20&orderDir=desc"

responseComunas = RestClient.get urlComunas
resultComunas = JSON.parse(responseComunas.to_s)
puts "\n"*3+"-"*25+"  o  "+"-"*25+"\n"*3
puts "Las comunas en orden Descendente son:"
resultComunas.each_with_index{|comuna,index| puts "         #{index+1}.-  #{comuna["nombre"]} "}

# Comuna residencia
urlComunaVive = "https://apis.digital.gob.cl/dpa/comunas/10206"

responseComunaVive = RestClient.get urlComunaVive
resultComunaVive = JSON.parse(responseComunaVive.to_s)
puts "\n"*3+"-"*25+"  o  "+"-"*25+"\n"*3
puts "      Los datos de la comuna que resido son:"
puts "      nombre: #{resultComunaVive["nombre"]} "
puts "      latitud: #{resultComunaVive["lat"]}"
puts "      longitud: #{resultComunaVive["lng"]}"
puts "\n"*3+"-"*25+"  o  "+"-"*25+"\n"*3
