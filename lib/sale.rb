class Sale
  attr_accessor :id, :amount, :purchase_time, :vendor_id, :product_id

  def initialize(array)
    @id = array[0].to_i
    @amount = array[1].to_i
    @purchase_time = Time.parse(array[2])
    @vendor_id= array[-2].to_i
    @product_id= array[-1].to_i
  end

  def self.all
    CSV.read("./support/sales.csv").map do |array|
      Sale.new(array)
    end
  end

  def self.find(sale)
    all.find do |sales|
      sales.id == sale.to_i
    end
  end

  def self.find_by_amount_in_cents(cents)
    all.find do |total|
      total.amount == cents.to_i
    end
  end

  def self.find_all_by_product_id(product)
    all.select do |products|
      products.product_id == product.to_i
    end
  end

  def self.vendor_id(ven_num)
    all.select do |vendor|
      vendor.vendor_id == ven_num.to_i
    end
  end

  def vendor
    Vendor.find(vendor_id)
  end

  def product
    Product.find(product_id) 
  end

  def self.between(beginning_time, end_time)
    all.find_all do |sale|
      (beginning_time..end_time).include? sale.purchase_time 
    end
  end
end


