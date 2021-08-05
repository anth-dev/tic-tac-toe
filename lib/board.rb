# frozen_string_literal: true

class Board
  attr_reader :board

  def initialize(board = Array.new(3) { Array.new(3, nil ) } )
    @board = board
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

  # change check_for_win to game_won?
  def game_won?
    
  end

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

  def place_token(x, y, token)
    @board[x][y] = token
  end

end