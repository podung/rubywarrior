require_relative 'state'

class OffensiveState < State
  def matches
    context.danger?
  end

  def respond!
    context.warrior.attack!
  end
end
