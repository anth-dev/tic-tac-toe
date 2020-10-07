# frozen_string_literal: true

# Generate a gameboard to play on.
class GameBoard
  attr_accessor :a1, :a2, :a3, :b1, :b2, :b3, :c1, :c2, :c3
  attr_reader :player, :game_over

  def initialize
    @a1 = nil
    @a2 = nil
    @a3 = nil
    @b1 = nil
    @b2 = nil
    @b3 = nil
    @c1 = nil
    @c2 = nil
    @c3 = nil
    @game_over = false
    @player = select_random_player
  end

  def display_board
    system 'clear'

    board = %Q(
    #{a1.nil? ? "a1" : a1.owner} | #{b1.nil? ? "b1" : b1.owner} | #{c1.nil? ? "c1" : c1.owner}
    ------------
    #{a2.nil? ? "a2" : a2.owner} | #{b2.nil? ? "b2" : b2.owner} | #{c2.nil? ? "c2" : c2.owner}
    ------------
    #{a3.nil? ? "a3" : a3.owner} | #{b3.nil? ? "b3" : b3.owner} | #{c3.nil? ? "c3" : c3.owner}
    )
    puts board
  end

  def take_turn
    display_board
    puts "Go Player #{@player}"
    puts 'Enter the spot to place your token.'
    print '>'
    choice = gets.chomp
    handle_placement(choice.downcase)
    swap_players
    take_turn
  end

  def handle_placement(choice)
    case choice
    when 'a1'
      @a1 = Token.new(player)
    when 'a2'
      @a2 = Token.new(player)
    end
  end

  def swap_players
    if @player == 'X '
      @player = 'Y '
    else
      @player = 'X '
    end
  end

  # Put all the possible win conditions in an if statements.
  def check_for_win
    if (a1 && a2) && (a2 && a3)
      declare_winner(a1.owner) if (a1.owner == a2.owner) && (a2.owner == a3.owner)
    end

    if (b1 && b2) && (b2 && b3)
      declare_winner(b1.owner) if (b1.owner == b2.owner) && (b2.owner == b3.owner)
    end

    if (c1 && c2) && (c2 && c3)
      declare_winner(c1.owner) if (c1.owner == c2.owner) && (c2.owner == c3.owner)
    end

    if (a1 && b1) && (b1 && c1)
      declare_winner(a1.owner) if (a1.owner == b1.owner) && (b1.owner == c1.owner)
    end

    if (a2 && b2) && (b2 && c2)
      declare_winner(a2.owner) if (a2.owner == b2.owner) && (b2.owner == c2.owner)
    end

    if (a3 && b3) && (b3 && c3)
      declare_winner(a3.owner) if (a3.owner == b3.owner) && (b3.owner == c3.owner)
    end

    if (a1 && b2) && (b2 && c3)
      declare_winner(a1.owner) if (a1.owner == b2.owner) && (b2.owner == c3.owner)
    end

    if (a3 && b2) && (b2 && c1)
      declare_winner(a3.owner) if (a3.owner == b2.owner) && (b2.owner == c1.owner)
    end
  end

  def declare_winner(the_winner)
    puts "#{the_winner} is the winner!"
    @game_over = true
  end

  def select_random_player
    result = rand(1..2)
    result == 1 ? 'X ' : 'O '
  end

  def game_over?
    @game_over
  end
end

# Generate a token!
class Token
  attr_reader :owner

  def initialize(owner)
    @owner = owner
  end
end


my_board = GameBoard.new
my_board.take_turn
# # Generate a gameboard.
# my_board = GameBoard.new

# # Check if nil is returned by an empty space. Yes!
# p my_board.a1.nil?

# # Player X picks 'a1'. The space at the end is for the display.
# my_board.a1 = Token.new('X ')

# # Verify we can check the owner of the token on the gameboard.
# p my_board.a1.owner

# # Place tokens on a2 and a3. (a1 has been already placed)
# my_board.a2 = Token.new('X ')
# my_board.a3 = Token.new('X ')

# # Run the check for possible win method.
# my_board.check_for_win

# # Display the player choosen to go first.
# puts my_board.first_player
