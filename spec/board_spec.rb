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
      subject(:board_with_left_vertical_win) { described_class.new( [[x_token, x_token, x_token],[nil, nil, nil],[nil, nil, nil]]) }
      let(:x_token) { instance_double("Token", :owner => 'X') }

      it 'should return true' do
        expect(board_with_left_vertical_win).to be_game_won
      end
    end

    context 'when a middle vertical win condition has been met' do
      subject(:board_with_middle_vertical_win) { described_class.new( [[nil, nil, nil], [o_token, o_token, o_token], [nil, nil, nil]] ) }
      let(:o_token) { instance_double("Token", :owner => 'O') }

      it 'should return true' do
        expect(board_with_middle_vertical_win).to be_game_won
      end
    end

    context 'when a right vertical win condition has been met' do
      subject(:board_with_right_vertical_win) { described_class.new( [[nil, nil, nil], [nil, nil, nil], [o_token, o_token, o_token]] ) }
      let(:o_token) { instance_double("Token", :owner => 'O') }

      it 'should return true' do
        expect(board_with_right_vertical_win).to be_game_won
      end
    end

    context 'when a top horizontal win condition has been met' do
      subject(:board_with_top_horizontal_win) { described_class.new( [[nil, nil, x_token], [nil, nil, x_token], [nil, nil, x_token]] ) }
      let(:x_token) { instance_double("Token", :owner => 'X') }

      it 'should return true' do
        expect(board_with_top_horizontal_win).to be_game_won
      end
    end

    context 'when a middle horizontal win condition has been met' do
      subject(:board_with_middle_horizontal_win) { described_class.new( [[nil, o_token, nil], [nil, o_token, nil], [nil, o_token, nil]] ) }
      let(:o_token) { instance_double("Token", :owner => 'O') }

      it 'should return true' do
        expect(board_with_middle_horizontal_win).to be_game_won
      end
    end

    context 'when a bottom horizontal win condition has been met' do
      subject(:board_with_bottom_horizontal_win) { described_class.new( [[o_token, nil, nil], [o_token, nil, nil], [o_token, nil, nil]] ) }
      let(:o_token) { instance_double("Token", :owner => 'O') }

      it 'should return true' do
        expect(board_with_bottom_horizontal_win).to be_game_won
      end
    end

    context 'when a top left to bottom right diagonal win condition has been met' do
      subject(:board_with_top_left_to_bottom_right_win) { described_class.new ( [[nil, nil, x_token], [nil, x_token, nil],[x_token, nil, nil]] ) }
      let(:x_token) { instance_double("Token", :owner => 'X') }

      it 'should return true' do
        expect(board_with_top_left_to_bottom_right_win).to be_game_won
      end
    end

    context 'when a bottom left to top right diagonal win condition has been met' do
      subject(:board_with_bottom_left_to_top_right_win) { described_class.new( [[o_token, nil, nil], [nil, o_token, nil], [nil, nil, o_token]] ) }
      let(:o_token) { instance_double("Token", :owner => 'O') }

      it 'should return true' do
        expect(board_with_bottom_left_to_top_right_win).to be_game_won
      end
    end
  end

  describe '#return_winner' do

    context 'when X has a top horizontal win' do
      subject(:board_with_top_horizontal_win) { described_class.new( [[nil, nil, x_token], [nil, nil, x_token], [nil, nil, x_token]] ) }
      let(:x_token) { instance_double("Token", :owner => 'X') }

      it 'should return X' do
        expect(board_with_top_horizontal_win.return_winner).to eq('X')
      end

    end

    context 'when O has a middle vertical win' do
      subject(:board_with_middle_vertical_win) { described_class.new( [[nil, nil, nil], [o_token, o_token, o_token], [nil, nil, nil]] ) }
      let(:o_token) { instance_double("Token", :owner => 'O') }

      it 'should return O' do
        expect(board_with_middle_vertical_win.return_winner).to eq('O')
      end
    end

    context 'when O has a diagonal win' do
      subject(:board_with_bottom_left_to_top_right_win) { described_class.new( [[o_token, nil, nil], [nil, o_token, nil], [nil, nil, o_token]] ) }
      let(:o_token) { instance_double("Token", :owner => 'O') }

      it 'should return O' do
        expect(board_with_bottom_left_to_top_right_win.return_winner).to eq('O')
      end
    end

    context 'a win condition has not been met' do
      subject(:board_with_no_win) { described_class.new }
  
      it 'should return nil' do
        expect(board_with_no_win.return_winner).to be_nil
      end
    end
  end

  describe '#game_draw?' do

    context 'when there is a draw' do
      subject(:board_with_a_draw) { described_class.new( [[x_token, o_token, x_token], [o_token, o_token, x_token], [x_token, x_token, o_token]] ) }
      let(:x_token) { instance_double("Token", :owner => 'X') }
      let(:o_token) { instance_double("Token", :owner => 'O') }

      it 'should return true' do
        expect(board_with_a_draw).to be_game_draw
      end
    end

    context 'when there is no draw' do
      subject(:board_with_no_draw) { described_class.new( [[x_token, x_token, x_token], [o_token, x_token, o_token], [o_token, x_token, o_token]] ) }
      let(:x_token) { instance_double("Token", :owner => 'X') }
      let(:o_token) { instance_double("Token", :owner => 'O') }

      it 'should return false' do
        expect(board_with_no_draw).not_to be_game_draw
      end
    end

    context "when the board isn't full" do
      subject(:empty_board) { described_class.new }

      it 'should return false' do
        expect(empty_board).not_to be_game_draw
      end
    end

    
  end
end