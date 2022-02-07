class CodeMaker
  attr_reader :code

  def initialize
    @colors_array = ["red", "blue", "yellow", "black", "orange", "purple", "green", "white"]
  end

  def chose_random
    @show_chosen = @colors_array.sample(6)
    @code = @show_chosen.first(4) # There is code array
  end

  def show_ordered
    puts 'Ordered:'
    print @code
    puts
  end

  def show_unordered
    puts 'Shuffled:'
    print @show_chosen.map(&:capitalize).shuffle
    puts
  end
end

class CodeBreaker
  attr_reader :guess

  def initialize
    @guess = []
  end

  def array_reset
    @guess = []
  end

  def is_win?
    @black_peg == 4 ? true : false
  end

  def input
    puts
    puts 'Enter 4 Colours Without Comma'
    answer = gets.chomp.downcase
    if answer.split.length > 4 || answer.split.length < 4
      puts 'You should have entered 4 colour!'
      input
    else
      array_reset
      @guess << answer
      @guess = @guess.join(',').split
    end
  end

  # This method for whire and black pegs
  def check_pegs(code, guess)
    @white_peg = 0
    @black_peg = 0
    index = 0
    while index < code.length
      if code[index] == guess[index]
        @black_peg += 1
      elsif code.include?(guess[index]) && code[index] != guess[index]
        @white_peg += 1
      end
      index += 1
    end
    puts "There are #{@white_peg} white peg and #{@black_peg} black peg"
    is_win?
  end
end

class Game
  def initialize
    @codebreaker = CodeBreaker.new
    @codemaker = CodeMaker.new
  end

  def codemaker_choose
    @codemaker.chose_random
    #@codemaker.show_ordered #If you uncomment this and run the program
    #you see the answer
    @codemaker.show_unordered
  end

  def codebreaker_attempt
    guess_array = @codebreaker.input
    @codebreaker.check_pegs(@codemaker.code, guess_array)
  end

  def codemaker_attempt(guess_array)
    @random_array = @guess_array.shuffle
    print "#{@random_array.map(&:capitalize).join(' ')}"
    puts
    @codebreaker.check_pegs(guess_array, @random_array)
  end

  def codemaker_logic
    @guess_array = @codebreaker.input
    (1..20).each do |_i|
      sleep 0.75
      puts
      if codemaker_attempt(@guess_array) == true
        puts 'Computer won!'
        break
      end
      puts
    end
  end

  def codebreaker_logic
    (1..12).each do |_i|
      if codebreaker_attempt == true
        puts 'You won!'
        break
      end
    end
  end

  def creator_or_guesser
    puts 'Do you want to be Codemaker or Codebreaker'
    side_choose = gets.chomp.downcase

    if side_choose == 'codebreaker'
      codemaker_choose
      codebreaker_logic
    elsif side_choose == 'codemaker'
      codemaker_logic
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
