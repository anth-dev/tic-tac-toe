# frozen_string_literal: true

# Generate a Tic-Tac-Toe grid to play on.
class GameBoard
  attr_accessor :board
  attr_reader :player

  def initialize(player = select_random_player)
    @board = Array.new(3) { Array.new(3, nil ) }
    @player = player
  end

  def display_board
    system 'clear'

    board_for_display = %(
    #{@board[0][2].nil? ? 'a1' : @board[0][2].owner} | #{@board[1][2].nil? ? 'b1' : @board[1][2].owner} | #{@board[2][2].nil? ? 'c1' : @board[2][2].owner}
    ------------
    #{@board[0][1].nil? ? 'a2' : @board[0][1].owner} | #{@board[1][1].nil? ? 'b2' : @board[1][1].owner} | #{@board[2][1].nil? ? 'c2' : @board[2][1].owner}
    ------------
    #{@board[0][0].nil? ? 'a3' : @board[0][0].owner} | #{@board[1][0].nil? ? 'b3' : @board[1][0].owner} | #{@board[2][0].nil? ? 'c3' : @board[2][0].owner}
    )
    puts board_for_display
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
      @board[0][2].nil? ? @board[0][2] = Token.new(player) : take_turn
    when 'a2'
      @board[0][1].nil? ? @board[0][1] = Token.new(player) : take_turn
    when 'a3'
      @board[0][0].nil? ? @board[0][0] = Token.new(player) : take_turn
    when 'b1'
      @board[1][2].nil? ? @board[1][2] = Token.new(player) : take_turn
    when 'b2'
      @board[1][1].nil? ? @board[1][1] = Token.new(player) : take_turn
    when 'b3'
      @board[1][0].nil? ? @board[1][0] = Token.new(player) : take_turn
    when 'c1'
      @board[2][2].nil? ? @board[2][2] = Token.new(player) : take_turn
    when 'c2'
      @board[2][1].nil? ? @board[2][1] = Token.new(player) : take_turn
    when 'c3'
      @board[2][0].nil? ? @board[2][0] = Token.new(player) : take_turn
    else
      take_turn
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
    if board[0][2] && board[0][1] && board[0][0]
      declare_winner(board[0][2].owner) if (board[0][2].owner == board[0][1].owner) && (board[0][1].owner == board[0][0].owner)
    end

    if board[1][2] && board[1][1] && board[1][0]
      declare_winner(board[1][2].owner) if (board[1][2].owner == board[1][1].owner) && (board[1][1].owner == board[1][0].owner)
    end

    if board[2][2] && board[2][1] && board[2][0]
      declare_winner(board[2][2].owner) if (board[2][2].owner == board[2][1].owner) && (board[2][1].owner == board[2][0].owner)
    end

    if board[0][2] && board[1][2] && board[2][2]
      declare_winner(board[0][2].owner) if (board[0][2].owner == board[1][2].owner) && (board[1][2].owner == board[2][2].owner)
    end

    if board[0][1] && board[1][1] && board[2][1]
      declare_winner(board[0][1].owner) if (board[0][1].owner == board[1][1].owner) && (board[1][1].owner == board[2][1].owner)
    end

    if board[0][0] && board[1][0] && board[2][0]
      declare_winner(board[0][0].owner) if (board[0][0].owner == board[1][0].owner) && (board[1][0].owner == board[2][0].owner)
    end

    if board[0][2] && board[1][1] && board[2][0]
      declare_winner(board[0][2].owner) if (board[0][2].owner == board[1][1].owner) && (board[1][1].owner == board[2][0].owner)
    end

    if board[0][0] && board[1][1] && board[2][2]
      declare_winner(board[0][0].owner) if (board[0][0].owner == board[1][1].owner) && (board[1][1].owner == board[2][2].owner)
    end
  end

  def check_for_draw
    return unless board[0][2] && board[0][1] && board[0][0] && board[1][2] && board[1][1] && board[1][0] && board[2][2] && board[2][1] && board[2][0]
    
    display_board
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

class Token
  attr_reader :owner

  def initialize(owner)
    @owner = owner
  end
end

my_board = GameBoard.new

my_board.take_turn