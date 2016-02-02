require 'pry'
class Game
  attr_reader :guesses, :output, :correct
  attr_accessor :count

  def initialize
    colors = ["r", "g", "b", "y"]
    @correct = ["r", "g", "b", "y"]
    # correct = []
    # correct = [colors[rand(0..3)], colors[rand(0..3)], colors[rand(0..3)], colors[rand(0..3)]]
    @count = 0
    beginning_explanation
  end

  def beginning_explanation
    puts "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game. What's your guess?"
    output = gets.chomp
      if output.length > 4
        "Your guess is too long. Try again."
      elsif output.length < 4
        "Your guess is too short. Try again."
      elsif output == 'q' || output == 'quit'
        print_stats
      elsif output == 'c' || output == 'cheat'
        secret_code
      else
        game_method(output)
      end
  end

    def game_method(guesses)
      @count +=1
      guesses = guesses.chars
      if guesses.eql?(correct)
        end_game
      else
        postion_number
        correct_number
        results
      end
    end


    def position_number
      index = 0
      @position_num = 0
      while index <= @correct.length
        if guesses[index] == @correct.join[index]
          @position_num +=1
          index += 1
        else
          index +=1
        end
      end
      @position_num
    end

    def correct_number
      @correct_num = 0
      @guesses.each do |color|
        if correct.include?(color)
          correct_num +=1
        end
      end
      @correct_num
    end

    def results
      puts "'#{guesses.upcase}' has #{correct_num} of the correct elements with #{postion_num} in the correct postions \n You've taken #{@count} guess"
    end

    def end_game
      puts "Congratulation! You guessed the sequence '#{correct.upcase}' in #{@count} guesses over #{minutes} minutes, #{seconds} seconds. \nDo you want to (p)lay again or (q)uit?"
      output = gets
        if output.chomp == 'p' || output.chomp == 'play'
          ng = Game.new
        elsif output.chomp == 'q' || output.chomp == 'quit'
          exit_game
        else
          puts "This is not an option."
        end

    end


end
