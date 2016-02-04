require_relative 'game'
class Stopwatch
  attr_reader :initial_time
  attr_accessor :minutes, :seconds

  def initialize
    @initial_time = Time.now
  end

  def time_differentiation
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
end
