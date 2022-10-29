class DBHandler
  attr_reader :DB
  attr_accessor :brand_name, :category_name, :product_name, :file

  def initialize(handler)
    @file = set_file(handler)
    @DB = @file.read
               .split("\n")
               .map { |product| product.split(',') }
  end

  def set_file(handler)
    case handler
    when 'brand'
      return File.open("#{Dir.pwd}/db/catalogo_marca.txt", "a+")
    when 'category'
      return File.open("#{Dir.pwd}/db/catalogo_categorias.txt", "a+")
    when 'product'
      return File.open("#{Dir.pwd}/db/catalogo_product.txt", "a+")
    when 'inventory'
      return File.open("#{Dir.pwd}/db/inventario_final.txt", "a+")
    end
  end

  def db_search(search_expresion)
    @DB.select { |product| product[0].match?(/.*#{search_expresion}.*/i) }
  end

  def write(line)
    @file.write("\n#{line}")
  end

  def how_many
    @DB.count
  end
end
