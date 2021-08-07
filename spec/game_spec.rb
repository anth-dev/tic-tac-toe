# frozen_string_literal: true

require_relative '../lib/game'
require_relative '../lib/board'

describe Game do
  describe '#swap_players' do
   
    context 'when the player is X' do
      subject(:game_to_test_swap_players_as_x) { described_class.new }
      it 'change the player to O' do
        game_to_test_swap_players_as_x.swap_players
        expect(game_to_test_swap_players_as_x.player).to eq('O')
      end
    end

    context 'when the player is O' do
      subject(:game_to_test_swap_players_as_o) { described_class.new('O')}
      it 'change the player to X' do
        game_to_test_swap_players_as_o.swap_players
        expect(game_to_test_swap_players_as_o.player).to eq('X')
      end
    end

  end
end
