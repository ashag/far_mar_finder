class Vendor

attr_accessor :id, :name, :No_of_employees, :market_id

  def self.id(id)
      CSV.read("./support/vendors.csv").find do |array|
        array[0].to_i == id
      end
  end
  def self.name(name)
      CSV.read("./support/markets.csv").find do |array|
        array[1] == name
      end
  end
end  

#   def id
#   end

#   def name
#   end

#   def No_of_employees
#   end

#   def market_id
#   end

#end


