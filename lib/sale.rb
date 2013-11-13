class Sale
  attr_accessor :id, :amount_in_cents, :purchase_time, :vendor_id, :product_id

  def initialize(array)
    @id = array[0].to_i
    @amount_in_cents = array[1].to_i
    @purchase_time = array[2]
    @vendor_id= array[-2].to_i
    @product_id= array[-1]to_i
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
    all.find do |amount|
      amount.amount_in_cents == cents.to_i
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

  #doesn't make sense
  def vendor(sale_id)
    Sale.find(sale_id) do |sales|
      sales.vendor_id
    end
  end

  def product(product_id)
    Product.find(product_id) 
  end

  def self.between(beginning_time, end_time)
    all.find_all do |times|
      times.purchase_time == (beginning_time..end_time)
    end
  end
end


