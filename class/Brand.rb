require "#{Dir.pwd}/class/Product"

class Brand < Product
  attr_reader :brand_key, :db, :q_brands
  attr_accessor :brand

  def initialize(brand)
    # use super to use parent's attributes
    @brand = brand
    @db_handler = DBHandler.new('brand')
    @brand_key = set_brand_key
  end

  def set_brand_key
    "#{@db_handler.how_many}#{self.brand[0..2].upcase}3BS"
  end

  def alta_brand
    @db_handler.write("#{@brand_key},#{@brand}")
  end
end
