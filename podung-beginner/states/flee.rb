require_relative 'state'

class FleeState < State
  def matches
    context.near_death? &&
        context.not_in_battle &&
        cannot_see_enemy_behind &&
        context.taking_damage?
  end

  def respond!
    context.warrior.walk! :backward
  end

  private
  def cannot_see_enemy_behind
    first_non_empty_space = context.warrior.look(:backward).find { |space| !space.empty? }
    first_non_empty_space && !first_non_empty_space.enemy?
  end
end
