# frozen_string_literal: true

class Game
  attr_reader :player

  def initialize(player = 'X')
    @player = player
    @board = Board.new
  end

  def swap_players
    @player = if @player == 'X'
      'O'
    else
      'X'
    end
  end

  def take_turn
    @board.display_board
    puts "Go Player #{@player}"
    puts 'Enter the spot to place your token.'
    print '>'
    handle_placement
    @board.game_won?
    @board.game_draw?
    swap_players
    take_turn
  end

 
  def handle_placement
    choice = gets.chomp.downcase
    case choice
    when 'a1'
      @board.board[0][2].nil? ? @board.place_token(0, 2, Token.new(@player)) : take_turn
    when 'a2'
      @board.board[0][1].nil? ? @board.place_token(0, 1, Token.new(@player)) : take_turn
    when 'a3'
      @board.board[0][0].nil? ? @board.place_token(0, 0, Token.new(@player)) : take_turn
    when 'b1'
      @board.board[1][2].nil? ? @board.place_token(1, 2, Token.new(@player)) : take_turn
    when 'b2'
      @board.board[1][1].nil? ? @board.place_token(1, 1, Token.new(@player)) : take_turn
    when 'b3'
      @board.board[1][0].nil? ? @board.place_token(1, 0, Token.new(@player)) : take_turn
    when 'c1'
      @board.board[2][2].nil? ? @board.place_token(2, 2, Token.new(@player)) : take_turn
    when 'c2'
      @board.board[2][1].nil? ? @board.place_token(2, 1, Token.new(@player)) : take_turn
    when 'c3'
      @board.board[2][0].nil? ? @board.place_token(2, 0, Token.new(@player)) : take_turn
    else
      take_turn
    end

  end
end