require_relative 'state'

class RescueBackwardsState < State
  def matches
    context.warrior.feel(:backward).captive?
  end

  def respond!
    context.warrior.rescue! :backward
  end
end
