require 'Date'

class Market

  attr_accessor :id, :name, :address, :city, :county, :state, :zip

  def initialize(array)
    @id = array [0].to_i
    @name = array [1]
    @address = array[2]
    @city = array[3]
    @county = array[-3]
    @state = array[-2]
    @zip = array[-1]
  end

  def self.all
    @all_market ||= CSV.read("./support/markets.csv").map do |array|
      Market.new(array)
    end
  end

  def self.find(search)
    all.find do |market|
      market.id.to_i == search.to_i
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

  def vendors
    Vendor.by_market(id)
  end

  def self.random
    all.sample
  end

  def products
    a = Vendor.by_market(id)
    a.map { |vendor| Product.by_vendor(vendor.id)}
  end

  def self.search(search_term)
    all.select do |market|
      market.name.downcase.include? search_term || Vendor.find_by_name(search_term)
    end
  end 

  def prefered_vendor
    highsale = Vendor.revenue.vendor_id
    Vendor.find(highsale)
  end

  def prefered_vendor_by_date(date)
    sale_of_date = Sale.all.each { |go_girl| go_girl.purchase_time == Time.parse(date) }
    find_vendor = sale_of_date.max_by {|sale| sale.amount} 
    Vendor.find(find_vendor.vendor_id)
  end

  def worst_vendor
    low_sale = Sale.all.min_by {|vendor| vendor.amount}
    Vendor.find(low_sale.vendor_id)
  end

  def worst_vendor_by_date(date)
    sale_of_date = Sale.all.each { |go_girl| go_girl.purchase_time == Time.parse(date) }
    find_vendor = sale_of_date.min_by { |sale| sale.amount}
    Vendor.find(find_vendor.vendor_id)
  end
end


 
 
