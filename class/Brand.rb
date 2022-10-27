require "#{Dir.pwd}/class/Product"

class Brand < Product
  attr_reader :brand_key, :a_brands, :q_brands
  attr_accessor :brand

  def initialize(brand)
    # use super to use parent's attributes
    super(brand)
    @brand_key = set_brand_key
    @a_brands = get_file.read
                        .split("\n")
                        .map { |abrand| abrand.split(',') }
    @q_brands = @a_brands.count
  end

  def set_brand_key
    "#{@q_brands}#{self.brand[0..2].upcase}3BS"
  end

  def get_file
    File.open("#{Dir.pwd}/db/catalogo_marca.txt")
  end

  def alta_brand
    get_file.write("#{@brand_key},#{@brand}", mode: 'a')
  end
end