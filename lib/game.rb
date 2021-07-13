# frozen_string_literal: true

class Game
  attr_reader :player

  def initialize(player = 'X ')
    @player = player
  end

  def swap_players
    @player = if @player == 'X '
      'O '
    else
      'X '
    end
  end
end