class Product
  attr_accessor :id, :name, :vendor_id

  def initialize(array)
    @id = array[0].to_i
    @name = array[1]
    @vendor_id = array[2].to_i
  end

  def self.all
    CSV.read("./support/products.csv").map do |array|
      Product.new(array)
    end
  end

  def self.find(id)
    all.find do |product|
      product.id == id.to_i
    end
  end

  def self.find_by_name(product_name)
    all.find do |product|
      product.name == product_name
    end
  end

  def self.by_vendor(id)
    all.find_all do |vendor|
      vendor.vendor_id == id.to_i
    end
  end

  def market
    vendor.market
  end

  def vendor
    Vendor.find(vendor_id)
  end

  def sales
    Sales.select(vendor_id)
  end

end