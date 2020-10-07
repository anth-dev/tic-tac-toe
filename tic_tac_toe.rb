# frozen_string_literal: true

# Generate a gameboard to play on.
class GameBoard
  attr_accessor :a1, :a2, :a3, :b1, :b2, :b3, :c1, :c2, :c3
  attr_reader :player

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
    @player = select_random_player
  end

  def display_board
    system 'clear'

    board = %(
    #{a1.nil? ? 'a1' : a1.owner} | #{b1.nil? ? 'b1' : b1.owner} | #{c1.nil? ? 'c1' : c1.owner}
    ------------
    #{a2.nil? ? 'a2' : a2.owner} | #{b2.nil? ? 'b2' : b2.owner} | #{c2.nil? ? 'c2' : c2.owner}
    ------------
    #{a3.nil? ? 'a3' : a3.owner} | #{b3.nil? ? 'b3' : b3.owner} | #{c3.nil? ? 'c3' : c3.owner}
    )
    puts board
  end

  def take_turn
    display_board
    puts "Go Player #{@player}"
    puts 'Enter the spot to place your token.'
    print '>'
    handle_placement
    swap_players
    take_turn
  end

  # Make it so it checks if the spot is free.
  def handle_placement
    choice = gets.chomp.downcase
    case choice
    when 'a1'
      @a1.nil? ? @a1 = Token.new(player) : take_turn
    when 'a2'
      @a2.nil? ? @a2 = Token.new(player) : take_turn
    when 'a3'
      @a3.nil? ? @a3 = Token.new(player) : take_turn
    when 'b1'
      @b1.nil? ? @b1 = Token.new(player) : take_turn
    when 'b2'
      @b2.nil? ? @b2 = Token.new(player) : take_turn
    when 'b3'
      @b3.nil? ? @b3 = Token.new(player) : take_turn
    when 'c1'
      @c1.nil? ? @c1 = Token.new(player) : take_turn
    when 'c2'
      @c2.nil? ? @c2 = Token.new(player) : take_turn
    when 'c3'
      @c3.nil? ? @c3 = Token.new(player) : take_turn
    end
    check_for_win
    check_for_draw
  end

  def swap_players
    @player = if @player == 'X '
                'O '
              else
                'X '
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

  def check_for_draw
    return unless a1 && a2 && a3 && b1 && b2 && b3 && c1 && c2 && c3

    puts "It's a draw!"
    exit
  end

  def declare_winner(the_winner)
    display_board
    puts "#{the_winner} is the winner!"
    exit
  end

  def select_random_player
    result = rand(1..2)
    result == 1 ? 'X ' : 'O '
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
