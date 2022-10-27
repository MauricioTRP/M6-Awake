require "#{Dir.pwd}/class/Product"
require 'byebug'

class DBHandler
  attr_reader :DB
  attr_accessor :brand_name, :category_name, :product_name, :file

  def initialize
    @file = File.open("#{Dir.pwd}/db/inventario_final.txt", "a+")
    @DB = @file.read
               .split("\n")
               .map { |product| product.split(',') }
  end

  def db_search(search_expresion)
    @DB.select { |product| product[0].match?(/.*#{search_expresion}.*/i) }
  end

  def write(line)
    @file.write(line, )
  end

  def how_many
    @DB.count
  end
end