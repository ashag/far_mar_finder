class Vendor

  attr_accessor :id, :name, :no_of_employees, :market_id
   
    def initialize(array)
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

  #   def id(id)
  #       all.find do |vendor|
  #         vendor.id.to_i == id
  #       end
  #     end
  #   end

  #   def name(name)
  #     all.select do |vendor|
  #       vendor.name == name
  #     end
  #   end

  #   def No_of_employees(empl)
  #     all.select do |vendor|
  #       vendor.no_of_employees.to_i == no_of_employees
  #     end
  #   end


  #   def market_id(m_id)
  #   end
  # end  




