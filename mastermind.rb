class CodeMaker
  attr_reader :code

  def initialize
    @colors_array = ["red","blue","yellow","black","orange","purple","green","white"] 
  end

  def choose_pattern
    @show_chosen = @colors_array.sample(6)
    @code = @show_chosen.first(4)
  end

  def show_ordered
    puts 'Ordered:'
    print @code
    puts
  end

  def show_unordered
    puts 'Shuffled:'
    print @show_chosen.shuffle
    puts
  end
end

class CodeBreaker
  attr_reader :guess

  def initialize
    @guess = []
  end

  def make_array_empty
    @guess = []
  end

  def is_win? 
     @black_peg == 4 ? true : false
  end

  def guess_code
    puts 'Enter 4 guess without comma'
    answer = gets.chomp.downcase
    if answer.split.length > 4
      puts 'You should have entered 4 colour!'
      guess_code
    else
      make_array_empty
      @guess << answer
      @guess = @guess.join(',').split
    end
  end

  # This method for whire and black pegs
  def check_guess(code, guess)
    @white_peg = 0
    @black_peg = 0
    index = 0
    while index < code.length
      if code[index] == guess[index]
        @black_peg += 1
        puts "Black => #{@black_peg}"
      elsif guess.any? { |c| code.include?(c) } && code[index] != guess[index]
        @white_peg += 1
        puts "White => #{@white_peg}"
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
    @codemaker.choose_pattern
    @codemaker.show_ordered
    @codemaker.show_unordered
  end

  def codebreaker_attempt
    guess_array = @codebreaker.guess_code
     @codebreaker.check_guess(@codemaker.code, guess_array)
  end

  def guess
    @codebreaker.guess
  end

  def play
    codemaker_choose
    (1..12).each do |i|
      puts "#{i}. GUESS\n"
     #puts "Guess array is #{guess}"
      break if codebreaker_attempt == true
    end
  end
end

game = Game.new
game.play




# Computer randomly selects 4 colors from colors_array


# (1..12).each do |i|


#    p guess
#    puts check_guess(code, guess)
# #puts "You have include #{answer.capitalize}" if code.include?(answer)
# end