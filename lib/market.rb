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

  def vendors_that_sell(item)
    @vendors.find_all do |vendor|
      vendor if vendor.item_list.include?(item)
    end
  end

  def total_inventory
    find_all_items.reduce({}) do |acc, item|
      acc[item] ||= {
        quantity: total_qty_by(item),
        vendors: vendors_that_sell(item)
      }
      acc
    end
  end

  def total_qty_by(item)
    vendors_that_sell(item).reduce(0) do |acc, vendor|
      acc += vendor.inventory[item]
      acc
    end
  end

  def overstocked_items
     items = []
     total_inventory.each do |item, details|
       items << item if details[:quantity] > 50 && details[:vendors].count > 1
     end
     items
   end

   def sorted_item_list
     find_all_items.collect { |item| item.name }.sort
   end

   def date
     Date.today.strftime("%d/%m/%Y")
   end

  # --------------

  def find_all_items
    @vendors.flat_map do |vendor|
      vendor.item_list
    end.uniq
  end

  def inventory_by_vendor
    # NOT USED
    @vendors.reduce({}) do |acc, vendor|
      acc[vendor] ||= vendor.inventory
      acc
    end
  end

end
