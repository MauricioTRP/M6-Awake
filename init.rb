require './class/Product'
require './class/Brand'
require './class/Category'

class Program
  def initialize
    puts "#{'-'*50}"
    puts "|#{" "*17}Bienvenido al identificador de precios 3b's#{" "*17}|"
    puts "#{'-'*50}#{"\n"*4}"
    puts "Qué acción quieres realizar:\n"
    self.select_action
  end

  def select_action
    puts "1. Alta de marca"
    puts "2. Alta de categoria"
    puts "3. Alta de producto"
    puts "4. Buscar producto por clave"
    selection = gets.chomp
    self.action_case(selection)
  end

  def action_case(selection)
    case selection
    when '1'
      puts 'Cual es la marca que quieres agregar?'
      brand = gets.chomp
      new_brand = Brand.new(brand)
      new_brand.alta_brand
    when '2'
      puts 'Cual es la categoría que quieres agregar?'
      category = gets.chomp
      new_category = Category.new(category)
      new_category.alta_category
    when '3'
      new_product = ask_product_attributes
      new_product.alta_product
    when '4'
      puts 'Ingrese la clave del producto que quieres buscar'
      search_expresion = gets.chomp
      db = DBHandler.new('inventory')
      puts db.db_search(search_expresion)
    end
  end

  def ask_product_attributes
    puts 'Ingrese el nombre del producto'
    name = gets.chomp
    puts 'Ingrese la unidad del producto'
    unit = gets.chomp
    puts 'Ingrese la marca del producto'
    brand = gets.chomp
    puts 'Ingrese la categoría del producto'
    product = gets.chomp
    puts 'Ingrese el precio del producto'
    price = gets.chomp.to_i
    Product.new(name, unit, brand, product, price)
  end
end

Program.new
