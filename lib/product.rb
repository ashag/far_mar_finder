class Product
  attr_accessor :product_id, :name, :vendor_id

  def initialize(array)
    @product_id = array[0]
    @name = array[1]
    @vendor_id = array[2] 
  end

  def self.all
    CSV.read("./support/products.csv").map do |array|
      Product.new(array)
    end
  end

  def self.find(search)
    all.find do |product|
      product.product_id.to_i == search.to_i
    end
  end

  def self.find_by_name(product_name)
    all.find do |product|
      product.name == product_name
    end
  end

  def self.find_all_by_vendorID(id)
    all.find_all do |vendor|
      vendor.vendor_id.to_i == id.to_i
    end
  end
end