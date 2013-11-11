
class Market

  attr_accessor :name, :address #etc

  def initialize(array)
    @name = 
  end

  def self.all_markets
    CSV.read("./support/markets.csv").map do |array|
      Market.new(array)
  end

  def ID
  end

  def name
  end

  def address
  end

  def city
  end

  def county
  end

  def state
  end

  def zip
  end
    
end