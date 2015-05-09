require_relative 'state'

class FleeState < State
  def matches
    context.near_death? && context.taking_damage? && context.not_in_battle
  end

  def respond!
    context.warrior.walk! :backward
  end
end
