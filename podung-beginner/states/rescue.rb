require_relative 'state'

class RescueState < State
  def matches
    context.warrior.feel.captive?
  end

  def respond!
    context.warrior.rescue!
  end
end
