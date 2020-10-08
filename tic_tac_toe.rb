# frozen_string_literal: true

# This module handles displaying the game board.
module Displayable
  def display_board
    system 'clear'

    board = %(
    #{display_a1} | #{display_b1} | #{display_c1}
    ------------
    #{display_a2} | #{display_b2} | #{display_c2}
    ------------
    #{display_a3} | #{display_b3} | #{display_c3}
    )
    puts board
  end

  def display_a1
    a1.nil? ? 'a1' : a1.owner
  end

  def display_a2
    a2.nil? ? 'a2' : a2.owner
  end

  def display_a3
    a3.nil? ? 'a3' : a3.owner
  end

  def display_b1
    b1.nil? ? 'b1' : b1.owner
  end

  def display_b2
    b2.nil? ? 'b2' : b2.owner
  end

  def display_b3
    b3.nil? ? 'b3' : b3.owner
  end

  def display_c1
    c1.nil? ? 'c1' : c1.owner
  end

  def display_c2
    c2.nil? ? 'c2' : c2.owner
  end

  def display_c3
    c3.nil? ? 'c3' : c3.owner
  end
end

# This module checks for win condition or draw.
module Winnable
  def check_for_vertical_win
    check_column_one
    check_column_two
    check_column_three
  end

  def check_for_horizontal_win
    check_row_one
    check_row_two
    check_row_three
  end

  def check_for_diagonal_win
    check_top_to_bottom
    check_bottom_to_top
  end

  def check_column_one
    return unless a1 && a2 && a3

    declare_winner(a1.owner) if (a1.owner == a2.owner) && (a2.owner == a3.owner)
  end

  def check_column_two
    return unless b1 && b2 && b3

    declare_winner(b1.owner) if (b1.owner == b2.owner) && (b2.owner == b3.owner)
  end

  def check_column_three
    return unless c1 && c2 && c3

    declare_winner(c1.owner) if (c1.owner == c2.owner) && (c2.owner == c3.owner)
  end

  def check_row_one
    return unless a1 && b1 && c1

    declare_winner(a1.owner) if (a1.owner == b1.owner) && (b1.owner == c1.owner)
  end

  def check_row_two
    return unless a2 && b2 && c2

    declare_winner(a2.owner) if (a2.owner == b2.owner) && (b2.owner == c2.owner)
  end

  def check_row_three
    return unless a3 && b3 && c3

    declare_winner(a3.owner) if (a3.owner == b3.owner) && (b3.owner == c3.owner)
  end

  def check_top_to_bottom
    return unless a1 && b2 && c3

    declare_winner(a1.owner) if (a1.owner == b2.owner) && (b2.owner == c3.owner)
  end

  def check_bottom_to_top
    return unless a3 && b2 && c1

    declare_winner(a3.owner) if (a3.owner == b2.owner) && (b2.owner == c1.owner)
  end

  def check_for_win
    check_for_vertical_win
    check_for_horizontal_win
    check_for_diagonal_win
  end

  def check_for_draw
    return unless column_one? && column_two? && column_three?

    display_board
    puts "It's a draw!"
    exit
  end

  def column_one?
    a1 && a2 && a3
  end

  def column_two?
    b1 && b2 && b3
  end

  def column_three?
    c1 && c2 && c3
  end

  def declare_winner(the_winner)
    display_board
    puts "#{the_winner} is the winner!"
    exit
  end
end

# This module checks if the spot is valid and places tokens owned by each
# player.
module Placeable
  # Refactor handle_placement to abstract the ternarys into separate methods
  # like was done for the Winnable module.
  def handle_placement
    choice = gets.chomp.downcase
    case choice
    when 'a1'
      check_and_place_a1
    when 'a2'
      check_and_place_a2
    when 'a3'
      check_and_place_a3
    when 'b1'
      check_and_place_b1
    when 'b2'
      check_and_place_b2
    when 'b3'
      check_and_place_b3
    when 'c1'
      check_and_place_c1
    when 'c2'
      check_and_place_c2
    when 'c3'
      check_and_place_c3
    else
      take_turn
    end
    check_for_win
    check_for_draw
  end

  def check_and_place_a1
    @a1.nil? ? @a1 = Token.new(player) : take_turn
  end

  def check_and_place_a2
    @a2.nil? ? @a2 = Token.new(player) : take_turn
  end

  def check_and_place_a3
    @a3.nil? ? @a3 = Token.new(player) : take_turn
  end

  def check_and_place_b1
    @b1.nil? ? @b1 = Token.new(player) : take_turn
  end

  def check_and_place_b2
    @b2.nil? ? @b2 = Token.new(player) : take_turn
  end

  def check_and_place_b3
    @b3.nil? ? @b3 = Token.new(player) : take_turn
  end

  def check_and_place_c1
    @c1.nil? ? @c1 = Token.new(player) : take_turn
  end

  def check_and_place_c2
    @c2.nil? ? @c2 = Token.new(player) : take_turn
  end

  def check_and_place_c3
    @c3.nil? ? @c3 = Token.new(player) : take_turn
  end
end

# Generate a Tic-Tac-Toe grid to play on.
class GameBoard
  include Winnable
  include Displayable
  include Placeable

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

  def take_turn
    display_board
    puts "Go Player #{@player}"
    puts 'Enter the spot to place your token.'
    print '>'
    handle_placement
    swap_players
    take_turn
  end

  def swap_players
    @player = if @player == 'X '
                'O '
              else
                'X '
              end
  end

  def select_random_player
    rand(1..2) == 1 ? 'X ' : 'O '
  end
end

# This class generates tokens for players to place.
class Token
  attr_reader :owner

  def initialize(owner)
    @owner = owner
  end
end

my_board = GameBoard.new
my_board.take_turn
