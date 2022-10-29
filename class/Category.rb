require "#{Dir.pwd}/class/Product"

class Category < Product
  attr_accessor :id_category, :category_name

  def initialize(category)
    @category = category
    @db_handler = DBHandler.new('category')
    @category_key = set_category_key
  end

  def set_category_key
    "#{@db_handler.how_many}#{self.category[0..2].upcase}3BS"
  end

  def alta_category
    @db_handler.write("#{@category_key},#{@category}")
  end
end
