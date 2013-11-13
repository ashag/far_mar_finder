class Vendor

  attr_accessor :vendor_id, :name, :no_of_employees, :market_id
   
    def initialize(array)
      @vendor_id = array[0]
      @id = array[0].to_i
      @name = array[1]
      @no_of_employees = array[2].to_i
      @market_id = array[3].to_i
    end

    def self.all
      CSV.read("./support/vendors.csv").map do |array|
        Vendor.new(array)
      end
    end

    def self.find(id)
      all.find do |vendor|
        vendor.vendor_id.to_i == search.to_i
      end
    end 

    def self.find_by_names(name)
        all.find do |names|
          names.name == name
        end
    end

    def self.find_all_by_market_id(market_num)
      all.select do |market|
        market.market_id.to_i == market_num.to_i
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
      Market.find(market_id)
    end

    def market
      Market.find(market_id)
    end

    def sales
      Sales.select(vendor_id)
    end

    def products
      Product.select(vendor_id)
    end
  end  





