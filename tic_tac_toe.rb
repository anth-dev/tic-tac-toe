# frozen_string_literal: true

# Generate a gameboard to play on.
class GameBoard
  attr_accessor :a1, :a2, :a3, :b1, :b2, :b3, :c1, :c2, :c3

  def initialize
    @a1 = nil
    @a2 = nil
    @a3 = nil
    @b1 = nil
    @b2 = nil
    @b3 = nil
    @c1 = nil
    @c2 = nil
    @c3 = nil
  end

  # Put all the possible win conditions in an if statements.
  def check_for_win
    if (a1 && a2) && (a2 && a3)
      puts "#{a1.owner} is the winner!" if (a1.owner == a2.owner) && (a2.owner == a3.owner)
    end

    if (b1 && b2) && (b2 && b3)
      puts "#{b1.owner} is the winner!" if (b1.owner == b2.owner) && (b2.owner == b3.owner)
    end

    if (c1 && c2) && (c2 && c3)
      puts "#{c1.owner} is the winner!" if (c1.owner == c2.owner) && (c2.owner == c3.owner)
    end

    if (a1 && b1) && (b1 && c1)
      puts "#{a1.owner} is the winner!" if (a1.owner == b1.owner) && (b1.owner == c1.owner)
    end

    if (a2 && b2) && (b2 && c2)
      puts "#{a2.owner} is the winner!" if (a2.owner == b2.owner) && (b2.owner == c2.owner)
    end

    if (a3 && b3) && (b3 && c3)
      puts "#{a3.owner} is the winner!" if (a3.owner == b3.owner) && (b3.owner == c3.owner)
    end

    if (a1 && b2) && (b2 && c3)
      puts "#{a1.owner} is the winner!" if (a1.owner == b2.owner) && (b2.owner == c3.owner)
    end

    if (a3 && b2) && (b2 && c1)
      puts "#{a3.owner} is the winner!" if (a3.owner == b2.owner) && (b2.owner == c1.owner)
    end
  end
end

# Generate a token!
class Token
  attr_reader :owner

  def initialize(owner)
    @owner = owner
  end
end

# Generate a gameboard.
my_board = GameBoard.new

# Check if nil is returned by an empty space. Yes!
p my_board.a1.nil?

# Player X picks 'a1'
my_board.a1 = Token.new('X')

# Verify we can check the owner of the token on the gameboard.
p my_board.a1.owner

# Place tokens on a2 and a3. (a1 has been already placed)
my_board.a2 = Token.new('X')
my_board.a3 = Token.new('X')

# Run the check for possible win method.
my_board.check_for_win
