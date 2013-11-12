class Market

  attr_accessor :market_id, :name, :address, :city, :county, :state, :zip

<<<<<<< HEAD
  def initialize(array)
    @market_id = array [0]
    @name = array [1]
    @address = array[2]
    @city = array[3]
    @county = array[-3]
    @state = array[-2]
    @zip = array[-1]
=======
  def initialize(n)
    @name = n
>>>>>>> 967417ad7fcfb2bd9286ebe3f09101ed076fbf2f
  end

  def self.all
    CSV.read("./support/markets.csv").map do |array|
      Market.new(array)
    end
  end
<<<<<<< HEAD
=======

  def self.find(id)
    CSV.read("./support/markets.csv").find do |array|
      array[0].to_i == id
    end
  end
end 



#end of market

#   def ID
#   end

#   def name
#   end

#   def address
#   end

#   def city
#   end
>>>>>>> 967417ad7fcfb2bd9286ebe3f09101ed076fbf2f

  def self.find(search)
    all.find do |market|
      market.market_id.to_i == search.to_i
    end
  end

  def self.find_by_name(match)
    all.find do |market_name| 
      market_name.name == match
    end
  end

  def self.find_all_by_state(state)
    all.find_all do |state_name| 
      state_name.state == state
    end
  end
end
 
 
