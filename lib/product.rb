class Product
  attr_accessor :id, :name, :vendor_id

  def initialize(array)
    @id = array[0]
    @name = array[1]
    @vendor_id = array[2] 
  end

  def self.all
    CSV.read("./support/products.csv").map do |array|
      Product.new(array)
    end
  end

  def id

  end

  def name
  end

  def vendor_id
  end
  
end