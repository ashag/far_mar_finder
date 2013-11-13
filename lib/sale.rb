class Sale
  attr_accessor :sale_id, :amount_in_cents, :vendor_id, :product_id

  def initialize(array)
    @sale_id = array[0]
    @amount_in_cents = array[1]
    @vendor_id= array[2]
    @product_id= array[3]
  end

  def self.all
    CSV.read("./support/sales.csv").map do |array|
      Sale.new(array)
    end
  end

  def self.find(sale)
    all.find do |sales|
      sales.sale_id.to_i == sale.to_i
    end
  end

  def self.find_by_amount_in_cents(cents)
    all.find do |amount|
      amount.amount_in_cents.to_i == cents.to_i
    end
  end

  def self.find_all_by_product_id(product)
    all.select do |products|
      products.product_id.to_i == product.to_i
    end
  end
end

  # def amount_in_cents
  # end

  # def purchase_time
  # end

  # def vendor_id
  # end

  # def product_id
  # end

