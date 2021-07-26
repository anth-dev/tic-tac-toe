# frozen_string_literal: true

# See about what needs to be required in the linked files.
require_relative '../lib/game'
require_relative '../lib/board'
require_relative '../lib/token'

# This file will be the script that runs the game.

puts "create a game object"
my_game = Game.new
p my_game

puts "create a token"
my_token = Token.new(my_game.player)
p my_token

p my_game.test_token