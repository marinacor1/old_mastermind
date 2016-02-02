class Game
  attr_reader :guesses, :count, :output

  def initialize
    colors = ["red", "green", "blue", "yellow"]
    correct = ["red", "green", "blue", "yellow"]
    # correct = []
    # correct << colors[rand(1..3)]
    # correct << colors[rand(1..3)]
    # correct << colors[rand(1..3)]
    # correct << colors[rand(1..3)]
    beginning_explanation
  end

  def beginning_explanation
    puts "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game. What's your guess?"
    output = gets
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
      if guesses.eql?(correct)
        end_game
      else
        index = 0
        correct_num = 0
        position_num = 0
        if guesses[index] == correct[index]
          position_num +=1
        else
          index +=1
        end
      end
        puts "'#{guesses.upcase}' has #{correct_num} of the correct elements with #{postion_num} in the correct postions \n You've taken #{@count} guess"
    end

    def end_game
      puts "Congratulation! You guessed the sequence '#{correct.upcase}' in #{@count} guesses over #{minutes} minutes, #{seconds} seconds. \nDo you want to (p)lay again or (q)uit?"
      output = gets
        if output == 'p' || output == 'play'
          ng = Game.new
        elsif output == 'q' || output == 'quit'
          exit_game
        else
          puts "This is not an option."
        end

    end







end
