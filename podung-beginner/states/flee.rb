require_relative 'state'

class FleeState < State
  def matches
    context.near_death? && context.taking_damage? && context.not_in_battle && cannot_see_archer_behind
  end

  def respond!
    context.warrior.walk! :backward
  end

  private
  def cannot_see_archer_behind
    first_non_empty_space = context.warrior.look(:backward).find { |space| !space.empty? }
    first_non_empty_space && !first_non_empty_space.enemy?
  end
end
