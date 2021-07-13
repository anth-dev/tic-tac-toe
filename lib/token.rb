# frozen_string_literal: true

class Token
  attr_reader :owner

  # Direct copy and paste from before refactor, probably not working.
  def initialize(owner)
    @owner = owner
  end
end