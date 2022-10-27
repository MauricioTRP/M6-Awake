require "#{Dir.pwd}/class/Product"
require "#{Dir.pwd}/class/DBHandler"

class Category < Product
  attr_accessor :id_category, :category_name

  def alta_category
    # Creates a new category
  end

end