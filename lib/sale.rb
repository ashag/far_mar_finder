class Sale
  attr_accessor :id, :amount_in_cents, :vendor_id, :product_id

  def initialize(array)
    @id = array[0]
    @amount_in_cents = [1]
    @vendor_id= [2]
    @product_id= [3]
  end

  def self.all
    CSV.read("./support/sales.csv").map do |array|
      Sale.new(array)
    end
  end

  def id
  end

  def amount_in_cents
  end

  def purchase_time
  end

  def vendor_id
  end

  def product_id
  end

end