def new_product
  puts "#{'-'*25}Agregue un nuevo producto#{'-'*25}"

  attributes = %w[clave nombre unidad precio promocion categoria]

  product = fill_product_with(attributes)
  attributes.each_with_index do |value, index|
    puts "#{value}: #{product[index]}"
  end
end

def fill_product_with(attributes)
  array = []
  attributes.each do |attribute|
    puts "Ingrese #{attribute}"
    pass_test = attribute == 'precio' || attribute == 'promocion'
    if pass_test
      array << ask_currency if attribute == 'precio'
      array << gets.chomp.to_i if attribute == 'promocion'
    else
      array << gets.chomp
    end
  end
  array
end

def ask_currency
  price = gets.chomp.to_i
  if price < 1000
    puts '¿El precio está en dólares? Si (s) - No (n)'
    answer = gets.chomp
    return "#{price} USD" if answer == 's'
    return "#{price} CLP" if answer == 'n'
  else
    return "#{price} CLP"
  end
end

def start
  puts "#{'-'*74}\n|#{' '*15}Bienvenido al identificador de precios 3b's#{' '*15}|\n#{'-'*74}"
  puts "\n"*3

  new_product
end

start