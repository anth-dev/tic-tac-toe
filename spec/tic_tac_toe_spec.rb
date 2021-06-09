# frozen_string_literal: true

require_relative '../lib/tic_tac_toe'

describe GameBoard do
  describe '#check_for_win' do
    subject(:win_board) { described_class.new }

    context 'vertical win' do

      it 'should declare a winner' do
        win_board.board[0][2] = Token.new('X')
        win_board.board[0][1] = Token.new('X')
        win_board.board[0][0] = Token.new('X')
        expect(win_board).to receive(:declare_winner).with(win_board.board[0][2].owner)
        win_board.check_for_win
      end
    end

    context 'diagonal win' do

      it 'should declare a winner' do
        win_board.board[0][2] = Token.new('X')
        win_board.board[1][1] = Token.new('X')
        win_board.board[2][0] = Token.new('X')
        expect(win_board).to receive(:declare_winner).with(win_board.board[0][2].owner)
        win_board.check_for_win
      end
    
    end

  end
end