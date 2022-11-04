# Ejercicio individual 3

def estatus_alumno(nombre = "", pass = "", nota = "")
    if nota == ""
       return "debes ingresar una nota"
   else
        if nota.to_i > 50
            status = "Aprobada"
        else
            status = "Reprobada"
        end
        return "#{nombre} tu estatus es #{status}"
   end
end

puts "Ingresa tu nombre"
v1 = gets.chomp
puts "Ingresa tu clave"
v2 = gets.chomp
puts "Ingresa tu nota"
v3 = gets.chomp

puts estatus_alumno(v1, v2, v3)