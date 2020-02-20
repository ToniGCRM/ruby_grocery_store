# git comments

require('pry')
require('colorize')

# Display a menu in the console for the user to interact with.
# Create a default array of hashes that represent items at a grocery store.
# Create a menu option to add items to a user's grocery cart.
# Create a menu option to display all the items in the cart.
# Create a menu option to remove an item from the users cart.
# Create a menu option to show the total cost of all the items in the user's cart.
# Add new items to the grocery store.

@inventory = [
  { name: 'banana', price: 0.69 },
  { name: 'bread', price: 1.00 },
  { name: 'milk', price: 3.00 },
  { name: 'cheese', price: 2.50 },
  { name: 'cereal', price: 3.25 },
  { name: 'ham', price: 23.75 }
]

@cart = [
]

@cart_total = 0.00

def menu
  print " *********************************
  Welcome to the Store Please select an option: 
  1) View available items
  2) Add items to my cart
  3) Remove items from my cart
  4) View cart
  5) Checkout 
  6) Add new item to store
  7) Exit
  *******************************
  "

menu_choice = gets.strip.to_i
  case menu_choice
    when 1
      # view items in store
      view_items
      sleep(2)
      menu
    when 2
      # add items to cart
     add_items
    when 3
      # remove items from cart
     remove_items
    when 4
      view_cart
      #see items in cart
      sleep(2)
      menu
    when 5
      # complete purchase
      checkout
    when 6
      # add items to store
      update_inventory
    when 7
      # Leave
      exit
    else
      # Error
      puts "Incorrect option, please choose 1 - 7.".colorize(:red)
  end
end
 

def view_items
  #Show all items in inventory with price
  puts "Today's Inventory:"
  puts
  @inventory.each_with_index do |item, i|
    puts "Item #{i+1} #{item[:name]} $#{item[:price]}"
  end
  puts
  puts
  puts
end

def add_items
  #add new items to cart
  view_items
  puts "What item do you want to add to your cart?"
    cart_item = gets.to_i
    @cart << @inventory[ cart_item - 1 ]
  #update total
  sub_price = @inventory[ cart_item - 1][:price]
  @cart_total = @cart_total + sub_price
  
  #puts @inventory[ cart_item - 1][:price]
  view_cart
  puts
  puts "Would you like to add another item? (y/n)"
  again = gets.strip
  if again == 'y'
    add_items
  else
    menu
  end
end

def remove_items
  #remove items from cart
  puts "Your cart has:"
  @cart.each_with_index do |item, i|
    puts "Item #{i+1} #{item[:name]} $#{item[:price]}"
    puts
  end
  puts "What item do you want to remove from your cart?"
    cart_item = gets.to_i
    @cart.delete_at(cart_item - 1)
  #update total
  sub_price = @inventory[ cart_item - 1][:price]
  @cart_total = @cart_total - sub_price

  #puts @inventory[ cart_item - 1][:price]
view_cart
puts
puts "Would you like to remove another item? (y/n)"
  again = gets.strip
  if again == 'y'
    remove_items
  else
    menu
  end
end

def view_cart
  # display all items in inventory 
  puts "Your cart has:"
  @cart.each_with_index do |item, i|
    puts "Item #{i+1} #{item[:name]} $#{item[:price]}"
    puts
  end
  puts "Running Total: $#{@cart_total.round(2)}"
end

def checkout
  #give total and ask for payment amount
  puts "Thank you for shopping at Toni's Grocery"
  sleep(1)
  puts "Your total is $ #{@cart_total.round(2)} "
  sleep(1)
  puts
  puts "Do you have any coupons? (y/n)"
  cpn = gets.strip
  if cpn == 'y'
    coupons
  else
  puts "Please pay for your food"
  puts "Would you like a receipt? (y/n)"
end

  receipt = gets.strip
  if receipt == 'y'
    puts "Here is your receipt"
    puts "********************".colorize(:yellow)
    @cart.each_with_index do |item, i|
      puts "Item #{i+1} #{item[:name]} $#{item[:price]}"
    end
    puts "Sub-total: $#{@cart_total.round(2)}"
    puts "Coupon savings: $#{@coupon_amount.round(2)}"
    puts "Tax: $#{(@cart_total*0.05).round(2)}"
    puts "Grand-total: $#{(@cart_total*1.05).round(2)}"
    puts "********************".colorize(:yellow)
    puts
    puts "Have a nice day" 
    exit
  else 
    puts "Have a nice day"
    exit
  end
end

def coupons
  puts "Please enter your coupon code:"
  code = gets.strip
  if code == "ABC"
    @cart_total = @cart_total * 0.8
    @coupon_amount = @cart_total * 0.2
    puts "You saved $#{@coupon_amount.round(2)}"
  else
    puts "That is not a valid coupon code."
  end
checkout
end


def update_inventory
  #add new items to store
  puts "What item do you want to add?"
    new_item = gets.strip
   puts "What does this item cost?"
    item_price = gets.to_f
   updated_item = { name: new_item, price: item_price }  
   @inventory << updated_item
  
   puts @inventory
   menu
end


# this is jonathan branch

menu