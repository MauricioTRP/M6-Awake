require 'byebug'
# ========== Products Definition ========================

product1 = ['', 'Palta', 'Fruta', 3900, 0, 'Abarrotes']
product2 = ['', 'Frutilla', 'Fruta', 1500, 10, 'Abarrotes']
product3 = ['', 'Jabón', 'Barra', 1000, 20, 'Aseo']

array_products = [product1, product2, product3]

# =======================================================

# Defines an ID for the product
def id_prod(array_products)
  array_products.each_with_index do |product, index|
    id = "#{index+1}#{product[1][0..2].upcase}3BS"
    product[0] = id
    product
  end
  array_products
end

# Defines price with taxes
def tax_price(array_products)
  array_products.map do |product|
    iva_price = product[3] * 1.19
    product.append(iva_price)
  end
  array_products
end

# Defines the total to paid with taxes of an array of products
def total_check(array_products)
  total = 0
  array_products.each do |product|
    total += product[6].to_i
  end
  total
end

# Puts info of products in console
def prints_totals(array_products)
  puts "#{'-' * 15} Catalogo de productos #{'-' * 15}\n\n"

  array_products.each do |product|
    puts "\nLos datos del producto son: \n"
    puts "Clave: #{product[0]}, Nombre: #{product[1]}"
    puts "El precio final es #{product[6]}"
  end
end

# Runs the routine in order to define the information needed
def routine_2(array_products)
  array_products = id_prod(array_products)

  array_products = tax_price(array_products)

  prints_totals(array_products)

  puts "\n\nEl total de la cuenta es: #{total_check(array_products)}"
end

routine_2(array_products)
