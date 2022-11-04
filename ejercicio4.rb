# Ejercicio 4 Mauricio Fuentes
# la función _recorrer es el primer problema
# la función _impares es el segundo problema
# la función _traslación es el tercer problema


# Para no colapsar la consola con información se recomienda probar 1 a 1 modificando el
# código invocando las funciones al final.


def _recorrer(array=%w[a b c d e f])
  # Dado un arreglo X, escribir un programa que recorra cada elemento del arreglo y muestre su valor.
  puts "Recorrer en sentido normal"
  for item in array
    puts item
  end

  puts"\n Recorrer en sentido inverso"
  for i in (1..array.length)
    puts array[-i]
  end
end


def _impares
  # imprime los números impares desde 0 a 255
  impares = []
  for i in 0..255
    if i%2 == 1
      impares.push(i)
    end
  end
  print impares
end

def _traslacion(array = %w[cero uno dos tres cuatro cinco seis siete])
  # Corre en un índice el array, al elemento final le asigna cero
  paso = []
  for i in 0..array.length-2
    paso.push(array[i+1])
  end
  paso.push(0)
  print paso
end



