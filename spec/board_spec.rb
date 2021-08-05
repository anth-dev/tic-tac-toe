# frozen_string_literal: true

require_relative '../lib/board'
require_relative '../lib/token'

describe Board do
  describe '#game_won?' do

    context 'when a win condition has not been met' do
      subject(:board_with_no_win) { described_class.new }
      it 'should return false' do
        expect(board_with_no_win).not_to be_game_won
      end
    end

    context 'when a win condition has been met' do

      it 'should return true' do
        test_token = double("Token", :owner => 'X ')
        subject(:board_with_win) { described_class.new( [[test_token, test_token, test_token],[nil, nil, nil],[nil, nil, nil]]) }
        expect(board_with_win).to be_game_won
      end
    end
  end
end