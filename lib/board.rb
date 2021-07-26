# frozen_string_literal: true

class Board
  attr_reader :board, :test_token

  def initialize
    @board = Array.new(3) { Array.new(3, nil ) }
    # the following is to just test token creation temporarily
    @test_token = Token.new('someone ')
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



end