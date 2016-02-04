require 'pry'
require_relative 'stopwatch'
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
  #
  # end
  def player_guess
    puts "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game. What's your guess?"
  end
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

  def path_selector(output)
    answer = @correct.join("")
    if output == 'q' || output == 'quit'
      abort( "Exiting game")
    elsif output == 'c' || output == 'cheat'
      puts "Shh. The secret code is: #{answer}."
      game_start
    elsif output.length > 4
      puts "Your guess is too long. Try again."
      game_start
    elsif output.length < 4
      puts "Your guess is too short. Try again."
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
    @correct_num = 0
    guesses.each do |letter|
      if correct.include?(letter)
        @correct_num +=1
        correct.delete(letter)
        correct
      end
    end
    @correct_num
  end

  def results(guesses)
    position_number(guesses)
    correct_number(guesses)
    puts "'#{guesses.upcase}' has #{@correct_num} of the correct elements with #{(@position.to_s)} in the correct position(s). \nYou've taken #{@count} guess(es)."
    game_start
  end

  def stopwatch
    new_time = Time.now
    diff = new_time - @initial_time
    if diff > 60
      @minutes = (diff/60).to_i
      @seconds = (((diff/60)/100) * 100).to_i
    else
      @minutes = 0
      @seconds = diff.to_i
    end
  end

  def congrats_message
    @correct = @correct.join("")
    puts "Congratulation! You guessed the sequence '#{@correct.upcase}' in #{@count} guesses over #{@minutes} minutes, #{@seconds} seconds. \nDo you want to (p)lay again or (q)uit?"
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
