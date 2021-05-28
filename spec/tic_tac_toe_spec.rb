# frozen_string_literal: true

require_relative '../lib/tic_tac_toe'

describe GameBoard do
  describe '#check_for_win' do

    context 'vertical win' do
      subject(:game_won) { described_class.new }

      before do
        game_won.a1 = Token.new('X')
        game_won.a2 = Token.new('X')
        game_won.a3 = Token.new('X')
      end

      it 'should declare a winner' do
        allow(game_won).to receive(:display_board)
        expect(game_won).to receive(:puts).with('X is the winner!')
        game_won.check_for_win
      end
    end
  end

end