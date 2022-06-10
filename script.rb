class Mastermind

  def generate_board
    @board = []
    for i in 0..3
      @board.push(['black', 'white', 'red', 'green', 'yellow', 'blue'].sample)
    end
    p "COMPUTER BOARD: ",board
    # return @board
    puts "\nWould you like to be the Mastermind or the Guesser?"
    @player_role = gets.chomp.strip.downcase[0]

    if @player_role == "m"
      @board = create_board
    end
  end

  attr_reader :player_role
  attr_reader :board

  def create_board
    puts "\nThe available colors are red, blue, green, yellow, white, and black."
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
    past_guesses = {"first" => [],"second" => [],
                              "third" => [],"fourth" => []}
    
    validity = []
    for i in 1..12
      guesses = []
      
      puts "\nTURN #{i}:\n"
      if i == 1
        guesses = 4.times.map{['black', 'white', 'red', 'green', 'yellow', 'blue'].sample}        
      else
        for j in 0..3
          if j == 0
            hash_index = 'first'
          elsif j == 1
            hash_index = 'second'
          elsif j == 2
            hash_index = 'third'
          elsif j == 3
            hash_index = 'fourth'
          end

          if validity[j] == 'correct'
            guesses.push(past_guesses[hash_index][-1])
          else
            guesses.push(['black', 'white', 'red', 'green', 'yellow', 'blue'].sample)
          end

        end

      end
      
      past_guesses["first"].push(guesses[0])
      past_guesses["second"].push(guesses[1])
      past_guesses["third"].push(guesses[2])
      past_guesses["fourth"].push(guesses[3])
      p past_guesses
      
      validity = check_guess(guesses)

      puts ''
      # p validity
  

      if check_all(guesses)
        puts "\nVICTORY FOR COMPUTER: The pattern was #{@board}!"
        break
      end
    end
  end

  def check_guess(guesses)
    responses = []
    guesses.each_with_index do |guess, i|
      if guess == @board[i]
        puts "Position #{i+1}: CORRECT"
        responses.push("correct")
      elsif @board.include?(guess)
        puts "Position #{i+1}: WRONG POSITION"
        responses.push("wrong_position")
      else
        puts "Position #{i+1}: INCORRECT"
        responses.push("incorrect")
      end
    end
    
    return responses
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

if game.player_role == 'm'
  puts "The computer will guess."
  game.make_computer_guesses

elsif game.player_role == 'g'
  puts "You will guess."
  game.make_player_guesses
  
end