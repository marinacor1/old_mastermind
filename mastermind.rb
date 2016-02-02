require_relative 'game'

puts "Welcome to MASTERMIND"
puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"

output = gets
g = Game.new
  if output == 'p'|| output == 'play'
    g.play
    #why is this running if play doesn't exist
  elsif output == 'i'|| output == 'instructions'
    g.instructions
  elsif output == 'q' || output == 'quit'
    #exit game
  else
    puts "This is not a valid option. Try again."
  end

g.beginning_explanation
