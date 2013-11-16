class Vendor

  attr_accessor :id, :name, :no_of_employees, :market_id
   
    def initialize(array)
      @id = array[0].to_i
      @name = array[1]
      @no_of_employees = array[2].to_i
      @market_id = array[3].to_i
    end

    def self.all
      @all_market ||= CSV.read("./support/vendors.csv").map do |array|
        Vendor.new(array)
      end
    end

    def self.find(id)
      all.find do |vendor|
        vendor.id == id.to_i
      end
    end 

    def self.find_by_name(ven_name)
      all.find do |vendor|
        vendor.name == ven_name
      end
    end

    def self.find_by_no_of_employees(empl)
      all.select do |vendor|
        vendor.no_of_employees == empl
      end
    end 

    def self.by_market(market_id)
      all.select do |vendor|
        vendor.market_id == market_id
      end
    end

    def self.random
      all.sample
    end

    def self.revenue
      Sale.all.max_by { |sale| sale.amount}
    end

    def self.revenue_top3
      Sale.all.sort_by {|sale| sale.amount}.first(3)
    end

    def self.most_items
      a = Sale.all.group_by {|sale| sale.vendor_id}
      a = a.max_by {|id, array| array.size}
      Vendor.find(a[0])
    end

    def market
      Market.find(market_id)
    end

    def sales
      Sale.vendor_id(id)
    end

    def products
      Product.by_vendor(id)
    end
end  

  




