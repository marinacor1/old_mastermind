require_relative 'game'

puts "Welcome to MASTERMIND"
puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"

output = gets.chomp
  if output == 'p'|| output == 'play'
    g = Game.new
    g.beginning_explanation
  elsif output == 'i'|| output == 'instructions'
    g = Game.new
    g.instructions
  elsif output == 'q' || output == 'quit'
    #exit game
  else
    puts "This is not a valid option. Try again."
  end
