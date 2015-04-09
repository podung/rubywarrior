require_relative 'state'

class CriticalState < State
  def matches
    context.near_death? && !context.taking_damage?
  end

  def respond!
    context.warrior.rest!
  end
end
