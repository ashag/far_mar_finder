require 'csv'
require 'time'
require_relative 'market'
require_relative 'product'
require_relative 'sale'
require_relative 'vendor'
# ... Require all of the supporting classes

class FarMarFinder
  # Your code goes here
<<<<<<< HEAD

  def markets
    Market.all.inspect
  end

  def vendors
    Vendor.all.inspect
  end

  def products
    Product.all.inspect
  end

  def sales
    Sale.all.inspect
  end
end
=======
end

finder = FarMarFinder.new
finder.markets.all

finder.market
finder.vendors
finder.products
finder.sales



>>>>>>> 967417ad7fcfb2bd9286ebe3f09101ed076fbf2f
