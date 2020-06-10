class Vendor
  attr_reader :name, :inventory
  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item, qty)
    @inventory[item] += qty
  end

  def potential_revenue
    @inventory.reduce(0) do |acc, (item, qty)|
      total = item.price * qty
      acc += total
      acc
    end 
  end
end
