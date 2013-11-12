class Market

  attr_accessor :market_id, :name, :address, :city, :county, :state, :zip

  def initialize(array)
    @market_id = array [0]
    @name = array [1]
    @address = array[2]
    @city = array[3]
    @county = array[-3]
    @state = array[-2]
    @zip = array[-1]
  end

  def self.all
    CSV.read("./support/markets.csv").map do |array|
      Market.new(array)
    end
  end

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
 
 