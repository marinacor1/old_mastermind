require 'pry'
class Game
  attr_reader :guesses, :output, :correct
#TODO do we need all the attributes and instance variables?
  def initialize
    colors = ["r", "g", "b", "y"]
    @time = Time.now
    @correct = [colors[rand(0..3)], colors[rand(0..3)], colors[rand(0..3)], colors[rand(0..3)]]
    @count = 0
    beginning_explanation
  end

  def beginning_explanation
    correct = @correct.join("")
    puts "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game. What's your guess?"
    output = gets.chomp
      if output == 'q' || output == 'quit'
        abort( "Exiting game")
      elsif output == 'c' || output == 'cheat'
        puts "Shh. The secret code is: #{correct}."
      elsif output.length > 4
        puts "Your guess is too long. Try again."
        beginning_explanation
      elsif output.length < 4
        puts "Your guess is too short. Try again."
        beginning_explanation
      else
        game_method(output)
      end
  end

    def game_method(guesses)
      @count +=1
      if guesses.chars.eql?(correct)
        end_game
      else
        position_number(guesses)
      end
    end

    def position_number(guesses)
      @position = 0
      guesses.each_with_index do |guess, index|
        if guess == correct[index]
          @position += 1
        end
      correct_number(guesses)
      end
    end

    def correct_number(guesses)
      #TODO doesn't account for doubles. for example if correct = 'yybg' if you guess 'gbby' will say 'you have 4 of the correct elements in one correct position'
      #also for correct = bggr said that guess bygr has 4 correct elements and 3 in correct position.
      # @corrects = []
      index = 0
      #TODO change while loops to iterators
      # binding.pry
      #this is wrong
      @corrects = []
      guesses_array = guesses.split("")
      #TODO I want to take the guesses_array and iterate through it so that if I get a match, it deletes from the correct section and doesn't run it again
      #find_index
      while index < 4 do
        @corrects << guesses_array.find{|color| color == @correct[index]}
        index +=1
       end
       @correct_num = @corrects.length
      results(guesses)
    end

    def results(guesses)
      puts "'#{guesses.upcase}' has #{@correct_num} of the correct elements with #{(@position.to_s)} in the correct position(s). \nYou've taken #{@count} guess(es)."
      beginning_explanation
    end

    def end_game
      new_time = Time.now
      diff = new_time - @time
      if diff > 60
        minutes = (diff/60).to_i
        seconds = (((diff/60)/100) * 100).to_i
      else
        minutes = 0
        seconds = diff.to_i
      end
      @correct = @correct.join("")
      puts "Congratulation! You guessed the sequence '#{@correct.upcase}' in #{@count} guesses over #{minutes} minutes, #{seconds} seconds. \nDo you want to (p)lay again or (q)uit?"
      output = gets.chomp
        if output == 'p' || output == 'play'
          g = Game.new
          g.beginning_explanation
        elsif output == 'q' || output == 'quit'
          abort( "Exiting game.")
        else
          puts "This is not an option."
          puts "Do you want to (p)lay again or (q)uit?"
          output = gets
        end
    end


end
