print "Ingresa la edad de tu hijo/a (sobrino/a u otro niño/a cercano)"
edad = gets.chomp.to_i


if edad >=0 && edad <= 3
    mensaje = "No debe tener contacto alguno con tecnología"
elsif edad >=4 && edad <= 6
    mensaje = "Debe ser restringino a una hora por día"  
elsif edad >=6 && edad <=18
    mensaje = "Debe ser restringino a dos horas por día"
elsif edad >=18
    mensaje = "Es un adulto, no requiere restricciones"
end

puts "Hola te Recomendamos esto para tu hijo #{mensaje}"