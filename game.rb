require_relative 'human_player'
require_relative 'ai_player'

class Game
  def initialize
    @codebreaker = HumanPlayer.new
    @codemaker = AIPlayer.new
  end

  def creator_or_guesser
    puts 'Do you want to be Codemaker or Codebreaker'
    side_choose = gets.chomp.downcase

    if side_choose == 'codebreaker'
      @codebreaker.set_colours
      @codebreaker.codebreaker_logic
    elsif side_choose == 'codemaker'
      @codemaker.codemaker_logic
    else
      puts 'Wrong choose. Chose again.'
      creator_or_guesser
    end
  end

  def play
    creator_or_guesser
  end
end

game = Game.new
game.play
