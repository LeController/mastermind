class Mastermind

  def generate_board
    @board = []
    for i in 0..3
      @board.push(['black', 'white', 'red', 'green', 'yellow', 'blue'].sample)
    end
    p "COMPUTER BOARD: ",board
    # return @board
    puts "Would you like to be the Mastermind or the Guesser?"
    @player_role = gets.chomp.strip.downcase

    if @player_role == "mastermind"
      @board = create_board
    end
  end

  attr_reader :player_role
  attr_reader :board

  def create_board
    puts "The available colors are red, blue, green, yellow, white, and black."
    @board = []
    for i in 0..3
      puts "\nWhat is your color for position #{i+1}?"
      color = gets.chomp.strip.downcase
      @board.push(color)

      print "\nPLAYER COLORS SO FAR: ",@board,"\n"
    end
    return @board
  end

  def make_player_guesses
    for i in 1..12
      puts "\nTURN #{i}:\n"
    
      player_guesses = get_guess
    
      check_guess(player_guesses)
    
      if check_all(player_guesses
      )
        puts "\nVICTORY FOR PLAYER: The pattern was #{@board}!"
        break
      end

      if i == 12
        puts "\nGAME OVER! The pattern was #{@board}!"
      end
    end
  end

  def make_computer_guesses
    for i in 1..12
      puts "\nTURN #{i}:\n"
      guesses = 4.times.map{['black', 'white', 'red', 'green', 'yellow', 'blue'].sample}
      p guesses
      
      check_guess(guesses)

      if check_all(guesses)
        puts "\nVICTORY FOR PLAYER: The pattern was #{@board}!"
        break
      end
    end
  end

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

  def check_all(guesses)
    if guesses == @board
      return true
    else
      return false
    end
  end

  def get_guess
    @player_guesses = []
    for i in 0..3
      puts "\nWhat is your guess for position #{i+1}?"
      guess = gets.chomp.strip.downcase
      @player_guesses.push(guess)

      print "\nPLAYER GUESSES SO FAR: ",@player_guesses,"\n"
    end

    return @player_guesses
  end

  attr_reader :player_guesses

end

game = Mastermind.new

game.generate_board

if game.player_role == 'mastermind'
  puts "The computer will guess."
  game.make_computer_guesses

elsif game.player_role == 'guesser'
  puts "You will guess."
  game.make_player_guesses
  
end