# frozen_string_literal: true

class Board
  attr_reader :board

  def initialize(board = Array.new(3) { Array.new(3, nil ) } )
    @board = board
  end

  def display_board
    system 'clear'

    board_for_display = %(
    #{@board[0][2].nil? ? 'a1' : @board[0][2].owner + ' '} | #{@board[1][2].nil? ? 'b1' : @board[1][2].owner + ' '} | #{@board[2][2].nil? ? 'c1' : @board[2][2].owner + ' '}
    ------------
    #{@board[0][1].nil? ? 'a2' : @board[0][1].owner + ' '} | #{@board[1][1].nil? ? 'b2' : @board[1][1].owner + ' '} | #{@board[2][1].nil? ? 'c2' : @board[2][1].owner + ' '}
    ------------
    #{@board[0][0].nil? ? 'a3' : @board[0][0].owner + ' '} | #{@board[1][0].nil? ? 'b3' : @board[1][0].owner + ' '} | #{@board[2][0].nil? ? 'c3' : @board[2][0].owner + ' '}
    )
    puts board_for_display
  end

  # change check_for_win to game_won?
  def game_won?
    if board[0][2] && board[0][1] && board[0][0]
      return true if (board[0][2].owner == board[0][1].owner) && (board[0][1].owner == board[0][0].owner)
    end

    if board[1][2] && board[1][1] && board[1][0]
      return true if (board[1][2].owner == board[1][1].owner) && (board[1][1].owner == board[1][0].owner)
    end

    if board[2][2] && board[2][1] && board[2][0]
      return true if (board[2][2].owner == board[2][1].owner) && (board[2][1].owner == board[2][0].owner)
    end

    if board[0][2] && board[1][2] && board[2][2]
      return true if (board[0][2].owner == board[1][2].owner) && (board[1][2].owner == board[2][2].owner)
    end

    if board[0][1] && board[1][1] && board[2][1]
      return true if (board[0][1].owner == board[1][1].owner) && (board[1][1].owner == board[2][1].owner)
    end

    if board[0][0] && board[1][0] && board[2][0]
      return true if (board[0][0].owner == board[1][0].owner) && (board[1][0].owner == board[2][0].owner)
    end

    if board[0][2] && board[1][1] && board[2][0]
      return true if (board[0][2].owner == board[1][1].owner) && (board[1][1].owner == board[2][0].owner)
    end

    if board[0][0] && board[1][1] && board[2][2]
      return true if (board[0][0].owner == board[1][1].owner) && (board[1][1].owner == board[2][2].owner)
    end

    return false
  end

  def return_winner
    if board[0][2] && board[0][1] && board[0][0]
      return board[0][2].owner if (board[0][2].owner == board[0][1].owner) && (board[0][1].owner == board[0][0].owner)
    end

    if board[1][2] && board[1][1] && board[1][0]
      return board[1][2].owner if (board[1][2].owner == board[1][1].owner) && (board[1][1].owner == board[1][0].owner)
    end

    if board[2][2] && board[2][1] && board[2][0]
      return board[2][2].owner if (board[2][2].owner == board[2][1].owner) && (board[2][1].owner == board[2][0].owner)
    end

    if board[0][2] && board[1][2] && board[2][2]
      return board[0][2].owner if (board[0][2].owner == board[1][2].owner) && (board[1][2].owner == board[2][2].owner)
    end

    if board[0][1] && board[1][1] && board[2][1]
      return board[0][1].owner if (board[0][1].owner == board[1][1].owner) && (board[1][1].owner == board[2][1].owner)
    end

    if board[0][0] && board[1][0] && board[2][0]
      return board[0][0].owner if (board[0][0].owner == board[1][0].owner) && (board[1][0].owner == board[2][0].owner)
    end

    if board[0][2] && board[1][1] && board[2][0]
      return board[0][2].owner if (board[0][2].owner == board[1][1].owner) && (board[1][1].owner == board[2][0].owner)
    end

    if board[0][0] && board[1][1] && board[2][2]
      return board[0][0].owner if (board[0][0].owner == board[1][1].owner) && (board[1][1].owner == board[2][2].owner)
    end
  end

  def game_draw?
    return false unless (board[0][2] && board[0][1] && board[0][0] && board[1][2] && board[1][1] && board[1][0] && board[2][2] && board[2][1] && board[2][0]) && (game_won? == false)
    true
  end

  def place_token(x, y, token)
    @board[x][y] = token
  end

end