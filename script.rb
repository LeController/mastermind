class Mastermind

  def generate_board
    @board = []
    for i in 0..3
      choice = ['black', 'white', 'red', 'green', 'yellow', 'blue'].sample
      @board.push(choice)
    end
    # p board
    return @board
  end

  attr_reader :board

  def check_guess(guesses)
    response = []
    guesses.each_with_index do |guess, i|
      if guess == @board[i]
        puts "Position #{i+1}: CORRECT"
      else
        puts "Position #{i+1}: INCORRECT"
      end
    end
  end

  def get_guess
    @player_guesses = []
    for i in 0..3
      puts "\nWhat is your guess for position #{i+1}?"
      guess = gets.chomp
      @player_guesses.push(guess)

      print "\nPLAYER GUESSES SO FAR: ",@player_guesses,"\n"
    end

    return @player_guesses
  end

  attr_reader :player_guesses

end

game = Mastermind.new

game.generate_board

for i in 1..12
  puts "\nTURN #{i}:\n"

  player_guesses = game.get_guess

  game.check_guess(player_guesses)
end
