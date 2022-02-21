require_relative 'game_logic'
class AIPlayer
  def initialize
    @game_logic = GameLogic.new
  end

  def codemaker_attempt()
    @random_array = @guess_array2.shuffle
    print "#{@random_array.map(&:capitalize).join(' ')}"
    puts
    @game_logic.check_pegs(@guess_array2, @random_array)
  end

  def codemaker_logic
    @guess_array2 = @game_logic.input
    (1..12).each do |i|
      sleep 0.75
      puts
      if codemaker_attempt == true
        puts "Computer won! Found in #{i}. attempt"
        break
      end
      if i == 12
        puts "Computer lost!"
      end
      puts
    end
  end
end