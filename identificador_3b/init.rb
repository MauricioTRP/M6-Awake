@attributes = %w[clave nombre unidad precio promocion categoria]
@usd = 0
@clp = 0

# Creates a new product
def new_product(attributes, iter)
  fill_product_with(attributes, iter)
end

# Logic of the product creation
def fill_product_with(attributes, iter)
  array = []
  attributes.each do |attribute|
    puts "Ingrese #{attribute} del producto #{iter}"
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

# Defines the currency of the product
def ask_currency
  price = gets.chomp.to_i
  if price < 1000
    puts '¿El precio está en dólares? Si (s) - No (n)'
    answer = gets.chomp
    if answer == 's'
      @usd += price
      return "#{price} USD"
    elsif answer = 'n'
      @clp += price
      return "#{price} CLP"
    end
  else
    @clp += price
    return "#{price} CLP"
  end
end

# Prints product in console
def print_product(product, iter, attributes)
  puts "#{'-' * 10} La información del producto #{iter} es #{'-' * 15}"

  attributes.each_with_index do |value, index|
    puts "#{value}: #{product[index]}"
  end
end

# totalizes currencies
def totals
  currency = %w[USD CLP]
  puts "#{'-'*10} Las sumas totales son: #{'-'*10}\n"
  puts "La suma de los precios capturados en USD es: #{@usd}"
  puts "La suma de los precios capturados en CLP es: #{@clp}"
end

# Initialized the routine
def routine_1(attributes)
  puts "#{'-'*74}\n|#{' '*15}Bienvenido al identificador de precios 3b's#{' ' * 15}|\n#{'-' * 74}"
  puts "\n"*3

  puts "¿Cuantos productos quieres ingresar?"
  q_products = gets.chomp.to_i

  products = []
  (1..q_products).each do |iter|
    puts "#{'-' * 15} Ingresa dato de producto #{iter + 1} #{'-' * 15}"
    products << new_product(attributes, iter)
    puts ''
  end

  products.each_with_index do |product, index|
    print_product(product, index + 1, attributes)
  end

  totals
end

routine_1(@attributes)
