require 'pry'
require_relative 'stopwatch'
require 'colorize'

class Game
  attr_reader :guesses, :output, :correct, :minutes, :seconds, :initial_time

  def initialize
    colors = ["r", "g", "b", "y"]
    @initial_time = Time.now
    @correct = [colors[rand(0..3)], colors[rand(0..3)], colors[rand(0..3)], colors[rand(0..3)]]
    @count = 0
  end

  # def game_start
  #   while #game is running #
  #     do
  #     output = gets.chomp
  #     path_selector(output)
  #     end
  # end

  def game_start
    player_guess
    # while game_still_going?
      # 1: get input from user
      # 2: figure out proper steps for that input
      # 3: check if we're still playing (maybe update status? / counter? / etc)
      # .... do stuff
    # end
    output = gets.chomp
    path_selector(output)
  end

  def player_guess
    puts "I have generated a beginner sequence with four elements made up of:"
    print "(r)ed".colorize(:red)
    print ", (g)reen".colorize(:green)
    print ", (b)lue".colorize(:blue)
    print ", and (y)ellow.".colorize(:yellow)
    puts "Use (q)uit at any time to end the game. What's your guess?"
  end

  def path_selector(output)
    answer = @correct.join("")
    if output == 'q' || output == 'quit'
      abort( "Exiting game")
    elsif output == 'c' || output == 'cheat'
      puts "¯\\_(ツ)_/¯ Fine, you cheater. I will give you the answer. The secret code is: #{answer.upcase}.".colorize(:light_blue)
      game_start
    elsif output.length > 4
      puts "Oh no! Your guess is too long. Try again."
      game_start
    elsif output.length < 4
      puts "Oh no! Your guess is too short. Try again."
      game_start
    else
      guess_validator(output)
    end
  end

  def guess_validator(guesses)
    @count +=1
    correct = @correct.join("")
    if guesses.eql?(correct)
      end_game
    else
      results(guesses)
    end
  end

  def results(guesses)
    position_number(guesses)
    correct_number(guesses)
    feedback(guesses)
    #if you get it wrong, i don't want it to prompt the same, but rather just give option to guess
    game_start
  end

  def position_number(guesses)
    @position = 0
    guesses = guesses.split("")
    guesses.each_with_index do |guess, index|
      if guess == correct[index]
        @position += 1
      end
      @position
    end
  end

  def correct_number(guesses)
    guesses = guesses.split("")
    correct = @correct.dup
    correct_num = 0
    guesses.each do |letter|
      if correct.include?(letter)
        correct_num +=1
        correct.delete_at(correct.index(letter))
        correct
      end
    end
    @correct_num = correct_num
  end

  def feedback(guesses)
    puts "'#{guesses.upcase}' has #{@correct_num} of the correct elements with #{(@position.to_s)} in the correct position(s). \nYou've taken #{@count} guess(es)."
  end

  def stopwatch
    time_diff = (Time.now - initial_time).divmod(60)
    @minutes = time_diff[0]
    @seconds = time_diff[1].to_i
  end

  def congrats_message
    correct = @correct.join("")
    puts "Congratulation! You guessed the sequence '#{correct.upcase}' in #{@count} guesses over #{@minutes} minutes, #{@seconds} seconds. \nDo you want to (p)lay again or (q)uit?"
  end

  def end_game
    stopwatch
    congrats_message
    output = gets.chomp
      if output == 'p' || output == 'play'
        g = Game.new
        g.game_start
      elsif output == 'q' || output == 'quit'
        abort( "Exiting game.")
      else
        puts "This is not an option. \nDo you want to (p)lay again or (q)uit?"
        output = gets
      end
  end


end
