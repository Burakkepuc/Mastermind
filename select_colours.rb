class SelectColours
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