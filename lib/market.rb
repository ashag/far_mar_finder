
class Market

  attr_accessor :name, :address #etc

  def initialize(n)
    @name = n
  end

  def self.all
    CSV.read("./support/markets.csv").map do |array|
      Market.new(array)
    end
  end

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

#   def county
#   end

#   def state
#   end

#   def zip
#   end
    
# end