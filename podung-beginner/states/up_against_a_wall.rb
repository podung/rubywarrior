require_relative 'state'

class UpAgainstAWallState < State
  def matches
    context.warrior.feel.wall?
  end

  def respond!
    context.warrior.pivot!
  end
end
