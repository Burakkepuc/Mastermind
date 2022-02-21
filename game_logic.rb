class GameLogic
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