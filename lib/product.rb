class Product
  attr_accessor :id, :name, :vendor_id

  def initialize(array)
    @id = array[0].to_i
    @name = array[1]
    @vendor_id = array[2].to_i
  end

  def self.all
    @all_market ||= CSV.read("./support/products.csv").map do |array|
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

  def self.random
    all.sample
  end

  def market
    Vendor.market
  end

  def vendor
    Vendor.find(vendor_id)
  end

  def sales
    Sale.all.select { |sale| sale.product_id == id}
  end

  def number_of_sales
    sales.count
  end

end