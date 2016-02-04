require_relative 'game'
require_relative 'instructions'

class Mastermind

  def initialize
    puts "Welcome to MASTERMIND"
    user_output
  end

  def user_output
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    output = gets.chomp
    if output == 'p'|| output == 'play'
      g = Game.new
      g.game_start
    elsif output == 'i'|| output == 'instructions'
      i = Instructions.new
      i.instructions
    elsif output == 'q' || output == 'quit'
       abort( "Exiting game.")
     else
       erroneous_response
     end
   end

   def erroneous_response
      puts "This is not a valid option. Try again."
      user_output
   end
end

m= Mastermind.new
