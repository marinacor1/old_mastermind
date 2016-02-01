class Game
  attr_reader :guesses

  def explanation
    puts "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game. What's your guess?"
    guesses = []
    output = gets
      if output == 'r'
        guess_array << 'red'
      elsif output == 'g'
        guess_array << 'green'
      elsif output == 'b'
        guess_array << 'blue'
      elsif output = 'y'
        guess_array << 'yellow'
      elsif output = 'q' || 'quit'
        #exit game
      elsif output = 'c' || output = 'cheat'
        #print out current secret code
      else
        puts "Please choose one of the options."
      end
  end


  def game_method(guesses)
    

  end

end
