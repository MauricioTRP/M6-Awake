require "#{Dir.pwd}/class/DBHandler"

class Product < DBHandler
  attr_reader :key, :final_price, :db
  attr_accessor :name, :unit, :brand, :category, :price

  def initialize(name, unit, brand, category, price)
    @name = name
    @unit = unit
    @brand = brand
    @category = category
    @price = price
    @final_price = set_final_price
    @db = DBHandler.new
    @key = set_key
  end

  def set_key
    @key = "#{@db.how_many+1}#{self.name[0..2].upcase}3BS"
  end

  def set_final_price
    @final_price = self.price * 1.19
  end

  def search_product(search_expresion)
    @db.db_search(search_expresion)
  end

  def alta_product
    @db.write("#{key},#{name},#{unit},#{brand},#{category},#{price},#{final_price}\n")
  end
end
