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

    context 'when a left vertical win condition has been met' do 
      subject(:board_with_left_vertical_win) { described_class.new( [[test_token_for_left_vertical_win, test_token_for_left_vertical_win, test_token_for_left_vertical_win],[nil, nil, nil],[nil, nil, nil]]) }
      let(:test_token_for_left_vertical_win) { double("Token", :owner => 'X') }

      it 'should return true' do
        expect(board_with_left_vertical_win).to be_game_won
      end
    end

    context 'when a middle vertical win condition has been met' do
      subject(:board_with_middle_vertical_win) { described_class.new( [[nil, nil, nil], [test_token_for_middle_vertical_win, test_token_for_middle_vertical_win, test_token_for_middle_vertical_win], [nil, nil, nil]] ) }
      let(:test_token_for_middle_vertical_win) { double("Token", :owner => 'O') }

      it 'should return true' do
        expect(board_with_middle_vertical_win).to be_game_won
      end
    end

    context 'when a right vertical win condition has been met' do
      subject(:board_with_right_vertical_win) { described_class.new( [[nil, nil, nil], [nil, nil, nil], [test_token_for_right_vertical_win, test_token_for_right_vertical_win, test_token_for_right_vertical_win]] ) }
      let(:test_token_for_right_vertical_win) { double("Token", :owner => 'O') }

      it 'should return true' do
        expect(board_with_right_vertical_win).to be_game_won
      end
    end

    context 'when a top horizontal win condition has been met' do
      subject(:board_with_top_horizontal_win) { described_class.new( [[nil, nil, test_token_for_top_horizonal_win], [nil, nil, test_token_for_top_horizonal_win], [nil, nil, test_token_for_top_horizonal_win]] ) }
      let(:test_token_for_top_horizonal_win) { double("Token", :owner => 'X') }

      it 'should return true' do
        expect(board_with_top_horizontal_win).to be_game_won
      end
    end

    context 'when a middle horizontal win condition has been met' do
      subject(:board_with_middle_horizontal_win) { described_class.new( [[nil, test_token_for_middle_horizontal_win, nil], [nil, test_token_for_middle_horizontal_win, nil], [nil, test_token_for_middle_horizontal_win, nil]] ) }
      let(:test_token_for_middle_horizontal_win) { double("Token", :owner => 'O') }

      it 'should return true' do
        expect(board_with_middle_horizontal_win).to be_game_won
      end
    end

    context 'when a bottom horizontal win condition has been met' do

    end

    context 'when a top left to bottom right diagonal win condition has been met' do

    end

    context 'when a bottom left to top right diagonal win condition has been met' do

    end
  end
end