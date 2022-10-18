require 'byebug'
@usd = 0
@clp = 0


# Creates a new product
def new_product(iter = '')
  # define an empty product
  product = {
    'clave' => '',
    'nombre' => '',
    'unidad' => '',
    'precio' => '',
    'promocion' => 0,
    'categoria' => '',
    'precio_final' => 0
  }
  product = fill_product_with(product, iter)
  new_register(product)
  print_a_product(product) if iter == ''
  print_a_product(product, iter) if iter != ''
end

# Logic of the product creation

# REFACTOR (CLAVE)
def fill_product_with(product, iter)
  attributes_to_fill = %w[nombre unidad precio promocion categoria]

  attributes_to_fill.each do |attribute|
    puts "Ingrese #{attribute} del producto #{iter}"
    pass_test = attribute == 'precio' || attribute == 'promocion'
    if pass_test
      product[attribute] << ask_currency if attribute == 'precio'
      product[attribute] << gets.chomp.to_i if attribute == 'promocion'
    else
      product[attribute] << gets.chomp
    end
  end
  product['clave'] = key_of_product(product, products_from_text.length)
  product['precio_final'] = product['precio'].split(' ').first.to_i*1.19
  product
end

# Defines the currency of the product
def ask_currency
  price = gets.chomp.to_i
  if price < 1000
    puts '¿El precio está en dólares? Si (s) - No (n)'
    answer = gets.chomp.downcase
    case answer
    when 's'
      @usd += price
      "#{price} USD"
    when 'n'
      @clp += price
      "#{price} CLP"
    end
  else
    @clp += price
    "#{price} CLP"
  end
end

def print_a_product(product, index = '')
  puts "#{'-' * 10} La información del producto #{index.to_i} es #{'-' * 15}"
  product.each do |key, value|
    puts "#{key}: #{value}"
  end
end

# totalizes currencies
def totals
  puts "#{'-'*10} Las sumas totales son: #{'-'*10}\n"
  puts "La suma de los precios capturados en USD es: #{@usd}"
  puts "La suma de los precios capturados en CLP es: #{@clp}"
end

# Initialized the routine for hand input new product
def new_products_by_hand
  puts '¿Cuantos productos quieres ingresar?'
  q_products = gets.chomp.to_i

  products = []
  (1..q_products).each do |iter|
    puts "#{'-' * 15} Ingresa dato de producto #{iter} #{'-' * 15}"
    products << new_product(iter) if q_products > 1
    products << new_product if q_products == 1
    puts ''
  end

  totals
end

# ============== Reads product ================================

# Reads "catalogo_productos.txt" file
def products_from_text
  products = File.read("#{__dir__}/db/catalogo_productos.txt").split("\n")
  products_array = []

  products.each do |product|
    products_array << hash_filler(product)
  end
  products_array
end

def hash_filler(product)
  # needs an array of products with each product as csv
  keys = %W[clave nombre unidad precio promocion categoria]

  product_hash = { 
    'clave' => '', 'nombre' => '', 'unidad' => '', 'precio' => '', 'promocion' => 0, 'categoria' => '', 'precio_final' => 0
  }
  product.split(',').each_with_index do |value, index|
    product_hash[keys[index]] = value
    product_hash['clave'] = "#{index + 1}#{product[1][0..2].upcase}3BS"
  end
  product_hash['precio_final'] = product_hash['precio'].split(' ').first.to_i * 1.19
  product_hash
end

def key_of_product(product, length = 1)
  "#{length.to_i}#{product['nombre'].gsub(/\s*/, '')[0..2].upcase}3BS"
end

# ======== Writes new product ====================================
def new_register(product)
  values = "\n"

  product.each do |key, value|
    if key != 'precio_final'
      values << "#{value},"
    end
  end
  File.write("#{__dir__}/db/catalogo_productos.txt", values[0...-1], mode: "a")
end

def prices_array(_product_array)
  prices = []

  products_from_text.each do |product|
    prices.append([product['precio'], product['precio_final']])
  end

  prices
end

# ================== Search Product ================================

def search_product_by_name(product_array, search_pattern)
  search_pattern = /\w*#{search_pattern}\w*/i

  product_array.select{ |product| product['nombre'][search_pattern]}
end

def search_product_by_id(product_array, search_pattern)
  search_pattern = /\w*#{search_pattern}\w*/i

  product_array.select{ |product| product['clave'][search_pattern]}
end

# ================== Prompt User ===================================

def promt_user
  puts "#{'-'*74}\n|#{' '*15}Bienvenido al identificador de precios 3b's#{' ' * 15}|\n#{'-' * 74}"
  puts "\n"*3
  puts "#{'-' * 25}Catalogo de Productos#{'-' * 25}#{"\n" * 4}"

  puts "Qué acción quieres realizar:\n"
  print "
  1. Generar un arreglo de producto
  2. Generar un arreglo de precios
  3. Generar un arreglo de precios con impuestos
  4. Ordenar el arreglo de precios
  5. Busar un producto en un arreglo
  6. Imprimir un productos ordenados por precio
  7. Leer archivos de txt
  8. Agregar un registro de txt
  9. Buscar producto por id\n\n
  Que acción quieres realizar: Salir (q)"

  answer = gets.chomp
  while answer != 'q'
    case answer
    when '1'
      new_products_by_hand
      puts "Producto creado\nQué acción quieres realizar: Salir (q)"
      answer = gets.chomp
    when '2'
      puts "El arreglo de precios es:"
      array = prices_array(products_from_text).map{ |prices| prices[0] }
      print array
      puts "\nQué acción quieres realizar: Salir (q)"
      answer = gets.chomp
    when '3'
      puts "El arreglo de precios con impuestos es:"
      array = prices_array(products_from_text).map{ |prices| prices[1] }
      print array
      puts "\nQué acción quieres realizar: Salir (q)"
      answer = gets.chomp
    when '4'
      puts "El arreglo de precios ordenado es:"
      array = prices_array(products_from_text).map{ |prices| prices[0] }
      print array.sort
      puts "\nQué acción quieres realizar: Salir (q)"
      answer = gets.chomp
    when '5'
      puts "¿Qué producto deseas buscar?"
      search_pattern = gets.chomp
      print search_product_by_name(products_from_text, search_pattern)

      puts "\nQué acción quieres realizar: Salir (q)"
      answer = gets.chomp
    when '6'
      array = products_from_text.sort_by{ |product| product['precio_final'] }
      puts array

      puts "\nQué acción quieres realizar: Salir (q)"
      answer = gets.chomp
    when '7'
      puts products_from_text

      puts "\nQué acción quieres realizar: Salir (q)"
      answer = gets.chomp
    when '8'
      new_product

      puts "\nQué acción quieres realizar: Salir (q)"
      answer = gets.chomp
    when '9'
      puts "¿Qué clave de producto deseas buscar?"
      search_pattern = gets.chomp
      print search_product_by_id(products_from_text, search_pattern)

      puts "\nQué acción quieres realizar: Salir (q)"
      answer = gets.chomp
    end
  end
end

promt_user