# frozen_string_literal: true

require_relative '../lib/tic_tac_toe'

describe GameBoard do
  describe '#check_for_win' do

    context 'vertical win' do
      subject(:vertical_win) { described_class.new }

      before do
        vertical_win.a1 = Token.new('X')
        vertical_win.a2 = Token.new('X')
        vertical_win.a3 = Token.new('X')
      end

      it 'should declare a winner' do
        allow(vertical_win).to receive(:display_board)
        expect(vertical_win).to receive(:puts).with('X is the winner!')
        vertical_win.check_for_win
      end
    end

    context 'diagonal win' do
      subject(:diagonal_win) { described_class.new }

      before do
        diagonal_win.a1 = Token.new('X')
        diagonal_win.b2 = Token.new('X')
        diagonal_win.c3 = Token.new('X')
      end

      it 'should declare a winner' do
        allow(diagonal_win).to receive(:display_board)
        expect(diagonal_win).to receive(:puts).with('X is the winner!')
        diagonal_win.check_for_win
      end
    end

  end
end