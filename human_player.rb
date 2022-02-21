require_relative 'game_logic'
require_relative 'select_colours'

class HumanPlayer
  def initialize
    @game_logic = GameLogic.new
    @select_colours = SelectColours.new
  end

  def set_colours
    @select_colours.chose_random
    @select_colours.show_ordered # If you uncomment this line and run the program
    # you see the answer
    @select_colours.show_unordered
  end

  def codebreaker_attempt
    guess_array = @game_logic.input
    @game_logic.check_pegs(@select_colours.code, guess_array)
  end

  def codebreaker_logic
    (1..12).each do |i|
      if codebreaker_attempt == true
        puts "You won.Found in #{i}. attempt!"
        break
      end
      if i == 12
        puts 'Computer lost!'
      end
    end
  end
end