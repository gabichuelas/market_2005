class Market
  attr_reader :name, :vendors
  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.collect { |vendor| vendor.name }
  end

  # def vendors_by_item
  #   @vendors.reduce(Hash.new) do |acc, vendor|
  #     acc[]
  # end

  def vendors_that_sell(item)
    @vendors.find_all do |vendor|
      vendor if vendor.item_list.include?(item)
    end
  end

  def total_inventory

  end

end
