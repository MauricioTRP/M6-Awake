puts "-"*56
puts "|             Conversor de números romanos             |"
puts "-"*56
puts "\n"*3
puts "ingrese el número que quiere convertir"

numero = gets.chomp


def romanos(number)

  # Analiza si el dato ingresado es "número" o "texto" (arábico o romano)
  if number.ord < 65
    number = number.to_i
  else
    number = number.upcase
  end

  # Lista con números
  numeros = [1,2,3,4,5,6,7,8,9,10]
  romanos = ["I","II","III","IV","V","VI","VII","VIII","IX","X"]

  hashArabico = {}
  hashRomano = {}

  # Define los hash llave valor hashArabico =  {digito: romano}  hashRomano = {romano: digito}
  numeros.each_with_index {|numero,index| hashArabico[numero] = romanos[index]
  hashRomano[romanos[index]] = numero}

  # devuelve la conversión dependiendo del caso
  if number.class == Integer && hashArabico.has_key?(number)
    return "el número #{number} es #{hashArabico[number]} en números romanos"
  elsif number.class == String && hashRomano.has_key?(number)
    return "el número #{number} es #{hashRomano[number]} en números arábicos"
  else
    return "No se encontró el número"
  end
end

print romanos(numero)

