require 'pry'
@plates = []

def wallet
  puts "How much money do you have to spend?"
  #can I change the prompt to be a dollar sign?
  @wallet = gets.to_f
  main_menu
end

def main_menu
  puts "\nWhat main dish would like?"
  puts "  1: Meatloaf $5.00"
  puts "  2: Mystery Meat $3.00"
  puts "  3: Hash $2.00"
  puts "  4: Food info"
  puts "  5: Exit"
  @main_input = gets.to_i - 1
    if @main_input == 4
      exit
    elsif
      @main_input == 3
      view_description
    else
      @plates << @main[@main_input]
      first_choice
    end
end

@main = [{ meal: 'Meatloaf', cost: 5.00, calories: 650, description: 'Ground Beef with stuff mixed into it'},
        { meal: 'Mystery Meat', cost: 3.00, calories: 2000.0, description: 'Its best not to know'},
        { meal: 'Hash', cost: 2.00, calories: 725, description: 'Chopped up potatoes and ham grilled, up with melted cheese on top.'}]

@sides = [{side: 'Carrots', cost: 0.50, calories: 100, description: 'Real organic orange carrots'},
         {side: 'Watermelon', cost: 0.75, calories: 125, description: 'Sorta ripe hard watermelon'},
          {side: 'Jello', cost: 5.00, calories: 175, description: 'Perfectly springy red jello'}]


def sides_menu
  puts "\nWhat side dish would you like?"
  puts "  1: Carrots $ .50"
  puts "  2: Watermelon $ .75"
  puts "  3: Jello $5.00"
  @sides_input = gets.to_i - 1

  if @sides_input > 2
    puts "Invalid entry, please select an item."
    sides_menu
  else
    extras
  end
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
  total = 0
  calories = 0
  @plates.each do |i|
    total += i[:cost]
  end
    if total > @wallet
      puts "You have gone over your budget, order again."
      @plates.clear
      main_menu
    end
  @plates.each do |c|
    calories += c[:calories]
  end
  puts "\nYour total is $#{total}"
  puts "Your total calories will be #{calories} ya fatty!"
  order_new_meal
end

def order_new_meal
  puts "\nWould you like to order another meal? (y/n)"
  new_meal = gets.strip.downcase
  if new_meal == 'y'
    wallet
  else
    puts "Thank you for your order."
    exit
  end
end

def view_description
  puts "\nWhich item would you like a description of?"
  puts "  1. Meatloaf"
  puts "  2. Mystery Meat"
  puts "  3. Hash"
  puts "  4. Back to main menu"
  description = gets.to_i

  case description
    when 1
      puts @main[0][:meal]
      puts @main[0][:description]
      puts "calories: #{@main[0][:calories]}"
    when 2
      puts @main[1][:meal]
      puts @main[1][:description]
      puts "calories: #{@main[1][:calories]}"
    when 3
      puts @main[2][:meal]
      puts @main[2][:description]
      puts "calories: #{@main[2][:calories]}"
    else
      main_menu
  end
  view_description
end

wallet
