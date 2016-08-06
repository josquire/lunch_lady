#make menu for main dishes
  #can get description of food
#menu for side dishes repeat for more side dishes how ever many they want
#print out the order, can remove items or start over
#with cost totals and calorie totals
#loop it to get more orders

require 'pry'
@plates = []

def main_menu
  puts "What main dish would like?"
  puts "  1: Meatloaf"
  puts "  2: Mystery Meat"
  puts "  3: Slop"
  @main_input = gets.to_i - 1
  @plates << @main[@main_input]
  first_choice
end

@main = [{ meal: 'Meatloaf', cost: 5.00, calories: 650, description: 'Ground Beef with stuff mixed into it'},
        { meal: 'Mystery Meat', cost: 3.00, calories: 2000.0, description: 'Its best not to know'},
        { meal: 'Hash', cost: 2.00, calories: 725, description: 'Chopped up potatoes and ham grilled, up with melted cheese on top.'}]

@sides = [{side: 'Carrots', cost: 0.50, calories: 100, description: 'Real organic orange carrots'},
         {side: 'Watermelon', cost: 0.75, calories: 125, description: 'Sorta ripe hard watermelon'},
          {side: 'Jello', cost: 5.00, calories: 175, description: 'Perfectly springy red jello'}]


def sides_menu
  puts "\nWhat side dish would you like?"
  puts "  1: Carrots"
  puts "  2: Watermelon"
  puts "  3: Jello"
  @sides_input = gets.to_i - 1

#FIX THIS - for bad entry go back and try again
  #  if @sides_input == 0
  #    puts "Invalid entry, please select an item."
  #    sides_menu
  #  else
     extras
end

def first_choice
  @main_choice = @main[@main_input]
  puts @main_choice[:meal]
  puts @main_choice[:description]
  puts "Calories = #{@main_choice[:calories]}"
  puts "Cost $ #{@main_choice[:cost]}"
  sides_menu
end

def extras
  @sides_choice = @sides[@sides_input]
  puts @sides_choice[:side]
  puts @sides_choice[:description]
  puts "Calories = #{@sides_choice[:calories]}"
  puts "Cost $ #{@sides_choice[:cost]}"
  again
end

def again
  puts "\nWould you like another side? (y/n)"
  more_sides = gets.strip.downcase
  @plates << @sides[@sides_input]
    if more_sides == 'y'
      sides_menu
    else
      totals
    end
end

def totals
  #wallet - if total exceeds > what they say they have then...
  total = 0
  calories = 0
  @plates.each do |i|
    total += i[:cost]
  end
  @plates.each do |c|
    calories += c[:calories]
  end
  puts "\nYour total is $#{total}"
  puts "Your total calories will be #{calories} ya fatty!"
  order_new_meal
end

def order_new_meal
  #ask if they want to pay or be done, or order new meal
  puts "\nWould you like to order another meal? (y/n)"
  new_meal = gets.strip.downcase
  if new_meal == 'y'
    main_menu
  else
    puts "Thank you for your order."
    exit
  end
end

main_menu
