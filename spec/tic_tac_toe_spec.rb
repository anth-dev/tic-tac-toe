# frozen_string_literal: true

require_relative '../lib/tic_tac_toe'

describe GameBoard do
  describe '#check_for_win' do
    subject(:board) { described_class.new }

    context 'vertical win' do

      it 'should declare a winner' do
        board.a1 = Token.new('X')
        board.a2 = Token.new('X')
        board.a3 = Token.new('X')
        expect(board).to receive(:declare_winner).with(board.a1.owner)
        board.check_for_win
      end
    end

    context 'diagonal win' do

      it 'should declare a winner' do
        board.a1 = Token.new('X')
        board.b2 = Token.new('X')
        board.c3 = Token.new('X')
        expect(board).to receive(:declare_winner).with(board.a1.owner)
        board.check_for_win
      end
    
    end

  end
end