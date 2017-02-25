class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def total_count
    contents.values.sum
  end

  def add_item(item_id)
    contents[item_id.to_s] ||= 0
    contents[item_id.to_s] += 1
  end

  def count_of(item_id)
    contents[item_id.to_s]
  end


  def inventory
    #creates a hash of item objects and their quantity
    #can pass to the controller
    @inventory = {}
    @cart.contents.each do |id, quantity|
      @inventory[Item.find(id)] = quantity
    end
  end

  def sub_total
    #takes the item price and multiplies it by the quantity from
    #the inventory hash
    item.price * @inventory[item]
  end

end
