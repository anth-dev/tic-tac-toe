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

    context 'no win' do

      it 'should not declare a winner' do
        expect(win_board).not_to receive(:declare_winner)
        win_board.check_for_win
      end

    end

  end

  describe '#handle_placement' do
    subject(:placement_board) { described_class.new('X ') }

    context 'when a valid selection is given' do
      it 'should place the token' do
        
        allow(placement_board).to receive(:player_input).and_return('a1')
        placement_board.handle_placement
        expect(placement_board.board[0][2].owner).to eq('X ')
      end
    end

    context 'when an invalid selection is given' do
      it 'should not place a token' do
        allow(placement_board).to receive(:player_input).and_return('z5')
        allow(placement_board).to receive(:take_turn)
        placement_board.handle_placement
        expect(placement_board.board[0]).to all( be_nil )
        expect(placement_board.board[1]).to all( be_nil )
        expect(placement_board.board[2]).to all( be_nil )
        
      end
    end
  end
end
