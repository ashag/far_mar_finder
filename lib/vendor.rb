class Vendor

  attr_accessor :vendor_id, :name, :no_of_employees, :market_id
   
    def initialize(array)
      @vendor_id = array[0]
      @name = array[1]
      @no_of_employees = array[2]
      @market_id = array[3]
    end

    def self.all
      CSV.read("./support/vendors.csv").map do |array|
        Vendor.new(array)
      end
    end

    def self.find(search)
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
      end
    end
  end

  #   def No_of_employees(empl)
  #     all.select do |vendor|
  #       vendor.no_of_employees.to_i == no_of_employees
  #     end
  #   end

  #   def market_id(m_id)
  #   end
  # end  

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




